//
//  JYNoteAccountViewController.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteAccountViewController.h"
#import "JYNoteLoginViewController.h"

@interface JYNoteAccountViewController ()

@end

@implementation JYNoteAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 40)];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
//    JYNoteLoginViewController *loginVC = [[JYNoteLoginViewController alloc] init];
//    [self presentViewController:loginVC animated:YES completion:nil];
}

- (void)clickBtn {
    JYNoteLoginViewController *loginVC = [[JYNoteLoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:NO];
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
