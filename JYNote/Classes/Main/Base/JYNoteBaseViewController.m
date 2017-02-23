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
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)setNavigationBarTintColor:(UIColor *)color {
    [self.navigationController.navigationBar setTintColor:color];
}

- (void)setNavigationBarHidden:(BOOL)hidden {
    [self.navigationController.navigationBar setHidden:hidden];
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
