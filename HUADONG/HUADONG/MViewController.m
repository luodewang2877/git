//
//  MViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/2.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//
#import "MViewController.h"
#import "ViewController.h"
#import "SViewController.h"
#import "PViewController.h"
#import "GetNewBtn.h"
#import "LoginViewController.h"
@interface MViewController ()
@property (strong, nonatomic) NSArray *namearray;
@end

@implementation MViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GetNewBtn *txbtn = [[GetNewBtn alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-170, 100, 50, 50)];
    txbtn.tag = 0;
    [txbtn setImage:[UIImage imageNamed:@"login_top.png"] forState:UIControlStateNormal];
    [self.view addSubview:txbtn];
    GetNewBtn *mtbtn;
    GetNewBtn *mtbtnone;
    self.namearray = [[NSArray alloc]initWithObjects:@"我的行程",@"值班站长",@"车站名片",@"个人中心",@"退出登录", nil];
    [self.view addSubview:mtbtnone];
    for(int k = 0; k < 5; k++){
        int h = + 60 +((k-1)*50);
        if (k == 0) {
            h = 0;
            UIImageView *lineone = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-165, self.view.frame.size.height/2 -150 + h - 10, self.view.frame.size.width, 0.3)];
            lineone.image = [UIImage imageNamed:@"line.png"];
            [self.view addSubview:lineone];
            UIImageView *linetwo = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-165, self.view.frame.size.height/2 -150 + h + 45, self.view.frame.size.width, 0.3)];
            linetwo.image = [UIImage imageNamed:@"line.png"];
            [self.view addSubview:linetwo];
        }
        mtbtn = [[GetNewBtn alloc]getNewMBtn:self.namearray[k] andCgrect:CGRectMake(self.view.frame.size.width/2-160, self.view.frame.size.height/2 -150 + h, self.view.frame.size.width/2+10, 40) andImageoneName:@"login_top.png" andImagetwoName:@"list_arrownext_n.png"];
        [mtbtn addTarget:self action:@selector(clickimagebtn:) forControlEvents:UIControlEventTouchUpInside];
        mtbtn.tag = k;
        [self.view addSubview:mtbtn]; 
    }
    // Do any additional setup after loading the view.
}
-(void)clickimagebtn:(UIButton *)btn{
    if(btn.tag == 0){
        CATransition* transition = [CATransition animation];
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromBottom;
 
        LoginViewController *login = [[LoginViewController alloc]init];
        login.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:login animated:YES completion:nil];
        // [self.navigationController pushViewController:login animated:YES];

    }
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
