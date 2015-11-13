//
//  YYFWUIViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/5.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "YYFWUIViewController.h"
@interface YYFWUIViewController ()
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *backButtonone;
@property (strong, nonatomic) UILabel *titlelabel;

@end
@implementation YYFWUIViewController
-(void)viewDidLoad{
    [self initTopView:@"预约服务"];
}
-(void)initTopView:(NSString *)titlename{
    self.titlelabel = [[UILabel alloc]init];
    self.titlelabel.text = titlename;
    self.titlelabel.textColor = [UIColor whiteColor];
    self.titlelabel.frame = CGRectMake(self.navigationController.view.frame.size.width/2-32,25, 100, 20);
    [self.navigationController.view addSubview:self.titlelabel];
    self.view.backgroundColor = [UIColor whiteColor];
    self.backButtonone = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButtonone];
    [self.backButtonone addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"top_goback_a.png"] forState:UIControlStateNormal];
    self.backButton.frame = CGRectMake(5,25, 80, 20);
    [self.backButton setTitle:@"主页面" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:self.backButton];
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
    [self.backButton removeFromSuperview];
    [self.titlelabel removeFromSuperview];
}
@end
