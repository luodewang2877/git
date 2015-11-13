
//
//  PViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/3.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "PViewController.h"

@interface PViewController ()

@end

@implementation PViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"滑动切换";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back-over"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(w - 3 * w / 4,h - 9* h / 10, 45, 30);
    backButton.userInteractionEnabled = YES;
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
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
