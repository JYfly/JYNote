//
//  JYNoteBaseViewController.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteBaseViewController.h"

@interface JYNoteBaseViewController ()

@end

@implementation JYNoteBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"毕业设计";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 100, 50)];
    label.text = @"毕业设计";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationBarTintColor:(UIColor *)color {
    [self.navigationController.navigationBar setTintColor:color];
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
