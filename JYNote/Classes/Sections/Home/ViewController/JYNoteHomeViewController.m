//
//  JYNoteHomeViewController.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteHomeViewController.h"
#import "JYNoteSoundTool.h"

@interface JYNoteHomeViewController ()

@end

@implementation JYNoteHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testView];
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.navigationItem.title = @"home";
}

//测试方法
- (void)testView {
    UIButton *startRecord = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 80, 50)];
    [startRecord setTitle:@"开始录制" forState:UIControlStateNormal];
    startRecord.backgroundColor = [UIColor blackColor];
    [startRecord addTarget:self action:@selector(startRecord) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *endRecord = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 80, 50)];
    [endRecord setTitle:@"结束录制" forState:UIControlStateNormal];
    endRecord.backgroundColor = [UIColor blackColor];
    [endRecord addTarget:self action:@selector(endRecord) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *startPlaying = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 80, 50)];
    [startPlaying setTitle:@"开始播放" forState:UIControlStateNormal];
    startPlaying.backgroundColor = [UIColor blackColor];
    [startPlaying addTarget:self action:@selector(startPlaying) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *endPlaying = [[UIButton alloc] initWithFrame:CGRectMake(150, 400, 80, 50)];
    [endPlaying setTitle:@"结束播放" forState:UIControlStateNormal];
    endPlaying.backgroundColor = [UIColor blackColor];
    [endPlaying addTarget:self action:@selector(endPlaying) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:startRecord];
    [self.view addSubview:endRecord];
    [self.view addSubview:startPlaying];
    [self.view addSubview:endPlaying];
}

- (void)startRecord {
    [[JYNoteSoundTool shareManager] startRecording];
}

- (void)endRecord {
    [[JYNoteSoundTool shareManager] stopRecording];
}

- (void)startPlaying {
    [[JYNoteSoundTool shareManager] playSound];
}

- (void)endPlaying {
    [[JYNoteSoundTool shareManager] stopPlaySound];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
