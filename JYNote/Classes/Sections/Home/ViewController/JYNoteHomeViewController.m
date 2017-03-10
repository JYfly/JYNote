//
//  JYNoteHomeViewController.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteHomeViewController.h"
#import "JYNoteSoundTool.h"
#import "JYNoteConst.h"
#import "JYNoteTableViewCell.h"
#import "JYNoteInfo.h"

@interface JYNoteHomeViewController () <UITableViewDelegate, UITableViewDataSource, JYNoteSoundToolDelegate>
{
    NSMutableArray *testArray;
}

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) JYNoteSoundTool *soundTool;

@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation JYNoteHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.soundTool = [[JYNoteSoundTool alloc] init];
    
    [self testView];
    
//    testArray = [[NSMutableArray alloc] init];
//    JYNoteInfo *info1 = [[JYNoteInfo alloc] init];
//    info1.noteTitle = @"111111";
//    [testArray addObject:info1];
//    
//    JYNoteInfo *info2 = [[JYNoteInfo alloc] init];
//    info2.noteTitle = @"222222";
//    [testArray addObject:info2];
//    
//    [self.view addSubview:self.myTableView];
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.navigationItem.title = @"home";
}

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _myTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}

#pragma mark - TableView DataSourse

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [testArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"JYNoteTableViewCell";
    JYNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[JYNoteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.noteInfo = [testArray objectAtIndex:indexPath.section];
    
    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"dianji");
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - 测试相关
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
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(30, 500, kScreenWidth - 60, 40)];
    self.progressView.progress = 0.0;
    
    [self.view addSubview:self.progressView];
    
    [self.view addSubview:startRecord];
    [self.view addSubview:endRecord];
    [self.view addSubview:startPlaying];
    [self.view addSubview:endPlaying];
}

- (void)startRecord {
    self.soundTool.delegate = self;
    [self.soundTool startRecording];
}

- (void)endRecord {
    [self.soundTool stopRecording];
}

- (void)startPlaying {
    [self.soundTool playSound];
}

- (void)endPlaying {
    [self.soundTool stopPlaySound];
}


- (void)updateProgress:(CGFloat)progress {
    [self.progressView setProgress:progress];
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
