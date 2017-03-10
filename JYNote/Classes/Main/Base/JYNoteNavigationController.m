//
//  JYNoteNavigationController.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteNavigationController.h"

@interface JYNoteNavigationController ()

@end

@implementation JYNoteNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor colorWithRed:(221.0/255.0) green:(160.0/255.0) blue:(92.0/255.0) alpha:1.0];
}


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController setNavigationBarHidden:(BOOL)hidden {
    
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setNavigationBarHidden:hidden animated:NO];
    }
    return self;
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
