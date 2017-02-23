//
//  JYNoteHomeViewController.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteHomeViewController.h"

@interface JYNoteHomeViewController ()

@end

@implementation JYNoteHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.navigationItem.title = @"home";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
