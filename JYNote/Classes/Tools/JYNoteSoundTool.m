//
//  JYNoteSoundTool.m
//  JYNote
//
//  Created by chen_sy on 2017/2/25.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteSoundTool.h"
#import "JYNoteConst.h"

@interface JYNoteSoundTool ()

//录音文件存放地址,根据传入地址动态修改
@property (nonatomic, strong) NSURL *fileUrl;

@property (nonatomic, strong) AVAudioSession *session;

@end

@implementation JYNoteSoundTool

+ (instancetype)shareManager {
    static JYNoteSoundTool *soundTool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        soundTool = [[self alloc] init];
    });
    return soundTool;
}

- (void)setFilePath:(NSString *)filePath {
    _filePath = filePath;
    //这里先设置为固定的path
    _filePath = kRecordAudioFile;
}

- (NSURL *)getSoundUrl {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:kRecordAudioFile];
    //self.recordFileUrl = [NSURL fileURLWithPath:filePath];
    NSLog(@"%@", filePath);
    return [NSURL URLWithString:filePath];
}

#pragma mark - recoder

- (AVAudioRecorder *)recorder {
    //设置录音参数
    NSMutableDictionary *settingDic = [[NSMutableDictionary alloc] init];
    if (!_recorder) {
        //设置录音格式
        [settingDic setObject:@(kAudioFormatAppleIMA4) forKey:AVFormatIDKey];
        // 录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
        [settingDic setObject:@(44100) forKey:AVSampleRateKey];
        //设置通道,这里采用单声道
        [settingDic setObject:@(1) forKey:AVNumberOfChannelsKey];
        // 线性音频的位深度  8、16、24、32
        [settingDic setObject:@(8) forKey:AVLinearPCMBitDepthKey];
        // 录音质量
        [settingDic setObject:[NSNumber numberWithInt:AVAudioQualityMedium] forKey:AVEncoderAudioQualityKey];
        
    }
    //每次需要重新获取路径
    //创建录音机
    _recorder = [[AVAudioRecorder alloc] initWithURL:[self getSoundUrl] settings:settingDic error:NULL];
    _recorder.delegate = self;
    //如果要监控声波则必须设置为YES
    _recorder.meteringEnabled = YES;
    
    [_recorder prepareToRecord];
    
    return _recorder;
}

- (void)startRecording {
    if (![self.recorder isRecording]) {
        // 真机环境下需要的代码
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *sessionError;
        [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
        
        if(session == nil) {
            NSLog(@"Error creating session: %@", [sessionError description]);
        }
        else {
            [session setActive:YES error:nil];
        }
        
        self.session = session;
        
        [self.recorder record];
    }
}

- (void)stopRecording {
    if ([self.recorder isRecording]) {
        [self.recorder stop];
    }
}

#pragma mark - player

- (void)playSound {
    if ([self.player isPlaying]) {
        return;
    }
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self getSoundUrl] error:NULL];
    [self.session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [self.player play];
}

- (void)stopPlaySound {
    [self.player stop];
}

#pragma mark - AVAudioRecorderDelegate
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    if (flag) {
        [self.session setActive:NO error:nil];
    }
}

@end
