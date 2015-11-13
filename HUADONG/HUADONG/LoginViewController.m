//
//  LoginViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/10.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *backButtonone;
@property (strong, nonatomic) UILabel *titlelabel;

@property (nonatomic,strong) UITextField *loginphonefied;
@property (nonatomic,strong) UITextField *loginpswfied;
@property (nonatomic,strong) UIImageView *bgimageinput;

@property (strong, nonatomic) UINavigationBar *nabar;
@property (strong, nonatomic) UILabel *titlelabelone;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBgView];
    [self initView];
    [self initTopView:@"请登录"];
    
    
    // Do any additional setup after loading the view.
}
-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.nabar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    [self.nabar setBackgroundImage:[UIImage imageNamed:@"top_bjcolor.png"]
                     forBarMetrics:UIBarMetricsDefault];
    [self.nabar setShadowImage:[UIImage imageNamed:@"top_bjcolor.png"] ];
    [self.nabar setFrame:CGRectMake(0,0, self.view.frame.size.width, 43)];
    [self.view addSubview:self.nabar];
    
}

-(void)initBgView{
    UIImageView *bgimage = [[UIImageView alloc]init];
    bgimage.frame = self.view.frame;
    bgimage.image = [UIImage imageNamed:@"umeng_socialize_oauth_check_off.png"];
    [self.view addSubview:bgimage];
    
    UIImageView *bgimagetop = [[UIImageView alloc]init];
    bgimagetop.frame = CGRectMake(0, 0, self.view.frame.size.width, 170);
    bgimagetop.image = [UIImage imageNamed:@"login_ep.9.png"];
    [self.view addSubview:bgimagetop];
    
    self.bgimageinput = [[UIImageView alloc]init];
    self.bgimageinput.frame = CGRectMake(20, 170, self.view.frame.size.width - 40, 100);
    self.bgimageinput.image = [UIImage imageNamed:@"feedback_edit_bg.png"];
    self.bgimageinput.userInteractionEnabled = YES;
    [self.view addSubview:self.bgimageinput];
    
    UIImageView *bgimageinputline = [[UIImageView alloc]init];
    bgimageinputline.image = [UIImage imageNamed:@"line.png"];
    bgimageinputline.frame = CGRectMake(10,self.bgimageinput.frame.size.height/2,self.bgimageinput.frame.size.width-20,2);
    [self.bgimageinput addSubview:bgimageinputline];
    
    self.loginphonefied = [[UITextField alloc] initWithFrame:CGRectMake(10,5,self.bgimageinput.frame.size.width-20,self.bgimageinput.frame.size.height/2-10)];
    self.loginphonefied.tag = 1;
    self.loginphonefied.delegate        = self;
    self.loginphonefied.tag             = 1;
    self.loginphonefied.placeholder = @"请输入手机号";
    self.loginphonefied.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.loginphonefied.leftViewMode = UITextFieldViewModeAlways;
    [self.bgimageinput addSubview:self.loginphonefied];
    
    self.loginpswfied = [[UITextField alloc] initWithFrame:CGRectMake(10,self.bgimageinput.frame.size.height/2+5,self.bgimageinput.frame.size.width-20,self.bgimageinput.frame.size.height/2-10)];
    self.loginpswfied.delegate        = self;
    self.loginpswfied.secureTextEntry = YES;
    self.loginpswfied.placeholder = @"请输入您的密码";
    self.loginpswfied.tag = 2;
    self.loginpswfied.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.loginpswfied.leftViewMode = UITextFieldViewModeAlways;
    [self.bgimageinput addSubview:self.loginpswfied];
    
    UIButton *loginbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginbtn.frame = CGRectMake(20, 290, self.view.frame.size.width - 40, 50);
    [loginbtn setBackgroundImage:[UIImage imageNamed:@"top_bjcolor.png"] forState:UIControlStateNormal];
    [loginbtn setTitle:@"登    录" forState:UIControlStateNormal];
    loginbtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [loginbtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [loginbtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [loginbtn addTarget:self action:@selector(loginClick)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginbtn];
    
}
-(void)loginClick{
    NSString *phone = self.loginphonefied.text;
    if (phone.length == 0) {
        [self clickBtn:10 andNumber:1 andView:self.loginphonefied];
        return;
    }
    NSString *psw = self.loginpswfied.text;
    if (psw.length == 0) {
        [self clickBtn:10 andNumber:1 andView:self.loginpswfied];
        return;
    }
}
-(void)clickBtn:(int)len andNumber:(int)num andView:(UITextField *)ut{
    [UIView animateWithDuration:0.07
                     animations:^{
                         ut.center = CGPointMake(ut.center.x + len,ut.center.y);
                     }
                     completion:^(BOOL finished) {
                         if (num >= 8) {
                             return;
                         }
                         if (num % 2 != 0) {
                             [self clickBtn:-10 andNumber:num + 1 andView:ut];
                         }else{
                             [self clickBtn:10 andNumber:num + 1 andView:ut];
                         }
                     }];
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
    [self.nabar addSubview:self.backButton];
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    textField.layer.cornerRadius = 4.0f;
    textField.layer.borderWidth = 2.0;
    textField.layer.borderColor = [[UIColor colorWithRed:51/255.0f green:161/255.0f blue:201/255.0f alpha:1.0]CGColor];
    return true;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    textField.layer.cornerRadius = 0.0f;
    textField.layer.borderWidth = 0.0;
    return true;
}
-(void)backClick{
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.backButton removeFromSuperview];
    [self.titlelabel removeFromSuperview];
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
