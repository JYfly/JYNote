//
//  JYNoteTabBarViewController.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteTabBarViewController.h"
#import "JYNoteHomeViewController.h"
#import "JYNoteAccountViewController.h"
#import "JYNoteNavigationController.h"

@interface JYNoteTabBarViewController ()

@end

@implementation JYNoteTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTabViewController];
}

- (void) initTabViewController {
    
    JYNoteHomeViewController *homeVC = [[JYNoteHomeViewController alloc] init];
    UITabBarItem *item0=[[UITabBarItem alloc]initWithTitle:@"笔记" image:nil tag:0];
    homeVC.tabBarItem = item0;
    
    JYNoteAccountViewController *accoutVC = [[JYNoteAccountViewController alloc] init];
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"账户" image:nil tag:1];
    accoutVC.tabBarItem = item1;
    self.viewControllers = [NSArray arrayWithObjects:homeVC, accoutVC, nil];
}

@end
