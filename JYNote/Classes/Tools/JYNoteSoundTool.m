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

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation JYNoteSoundTool


- (void)setFilePath:(NSString *)filePath {
    _filePath = filePath;
    //这里先设置为固定的path
    _filePath = kRecordAudioFile;
}

- (NSURL *)getSoundUrl {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:kRecordAudioFile];
    NSLog(@"%@", filePath);
    return [NSURL URLWithString:filePath];
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:0.1f target:self selector:@selector(testSoundIntensity) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)testSoundIntensity {
    [self.recorder updateMeters];//更新测量值
    float power= [self.recorder averagePowerForChannel:0];//取得第一个通道的音频，注意音频强度范围时-160到0
    CGFloat progress=(1.0/160.0)*(power+160.0);
    
    NSLog(@"progress = %f",progress);
    
    [self.delegate updateProgress:progress];
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
        //创建录音机
        NSError *error = nil;
        _recorder = [[AVAudioRecorder alloc] initWithURL:[self getSoundUrl] settings:settingDic error:&error];
        _recorder.delegate = self;
        //如果要监控声波则必须设置为YES
        _recorder.meteringEnabled = YES;
        
        [_recorder prepareToRecord];
        
        NSLog(@"%@",[_recorder prepareToRecord]?@"yes":@"no");
        
        if (error) {
            NSLog(@"创建录音机对象失败error info = %@",error.localizedDescription);
            return nil;
        }
    }
    return _recorder;
}

- (void)startRecording {
    if (![self.recorder isRecording]) {
        //设置为播放和录音状态，以便可以在录制完之后播放录音
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
        
        [self.timer fire];
    }
}

- (void)stopRecording {
    if ([self.recorder isRecording]) {
        [self.recorder stop];
        [self.timer invalidate];
        
        [self.delegate updateProgress:0.0];
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
