//
//  JYNoteAppDelegate.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//
#import "JYNoteAppDelegate.h"
#import "JYNoteNavigationController.h"
#import "JYNoteTabBarViewController.h"
#import "JYNoteHomeViewController.h"
#import "JYNoteAccountViewController.h"
#import "JYNoteBaseViewController.h"

@interface JYNoteAppDelegate ()

@property (nonatomic, strong) JYNoteNavigationController *rootNavigationViewController;

@end

@implementation JYNoteAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    self.window.rootViewController = [self rootNavigationViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - init Tab bar
/**
 *  此函数在整个app生命周期只能调用一次，构件一次
 */
- (JYNoteNavigationController *)rootNavigationViewController {
    if (_rootNavigationViewController) {
        return _rootNavigationViewController;
    }
    
    NSMutableArray *localViewControllersArray = [[NSMutableArray alloc] initWithCapacity:2];
    
    JYNoteHomeViewController *homeVC = [[JYNoteHomeViewController alloc] init];
    [self createTabBarItemForViewControllers:homeVC title:@"笔记"];
    [localViewControllersArray addObject:homeVC];
    
    JYNoteAccountViewController *accoutVC = [[JYNoteAccountViewController alloc] init];
    [self createTabBarItemForViewControllers:accoutVC title:@"账户"];
    [localViewControllersArray addObject:accoutVC];
    
    JYNoteTabBarViewController *tabVC = [[JYNoteTabBarViewController alloc] init];
    tabVC.viewControllers = localViewControllersArray;
    
    _rootNavigationViewController = [[JYNoteNavigationController alloc] initWithRootViewController:tabVC setNavigationBarHidden:NO];
    
    return _rootNavigationViewController;
}

- (JYNoteBaseViewController *)createTabBarItemForViewControllers:(JYNoteBaseViewController *)controller title:(NSString *)title {
    controller.tabBarItem.title = title;
    
    return controller;
}


@end

