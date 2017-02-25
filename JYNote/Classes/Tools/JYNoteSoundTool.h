//
//  JYNoteSoundTool.h
//  JYNote
//
//  Created by chen_sy on 2017/2/25.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface JYNoteSoundTool : NSObject <AVAudioRecorderDelegate>

//必须传入
@property (nonatomic, strong) NSString *filePath;

+ (instancetype)shareManager;
//录音对象
@property (nonatomic, strong) AVAudioRecorder *recorder;
//播放器对象
@property (nonatomic, strong) AVAudioPlayer *player;

//开始录音
- (void)startRecording;
//停止录音
- (void)stopRecording;
//播放声音
- (void)playSound;
//停止播放声音
- (void)stopPlaySound;

@end
