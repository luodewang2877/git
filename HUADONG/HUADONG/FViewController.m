//
//  FViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/2.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "FViewController.h"
#import "SViewController.h"
#import "MViewController.h"
#import "PViewController.h"
@interface FViewController ()
@property (strong, nonatomic) UIViewController *mainuic;
@property (strong, nonatomic) UIViewController *leftuic;
@property (strong, nonatomic) UIView *mainv;
@property (strong, nonatomic) UIView *leftv;
@property (strong, nonatomic) UIView *conmainvview;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIBarButtonItem *rebtn;
@property (strong, readwrite, nonatomic) UIImageView *backgroundImageView;
@property (assign, readwrite, nonatomic) CGFloat startX;
@end

@implementation FViewController
-(instancetype)initViewLeftView:(UIViewController *)leftuic andMainView:(UIViewController *)mainuic{
    self = [self init];
    if (self) {
        _mainuic = mainuic;
        _leftuic = leftuic;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _leftv = [[UIView alloc] init];
    _mainv = [[UIView alloc] init];
    _conmainvview = [[UIView alloc] init];
    self.backgroundImageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [UIImage imageNamed:@"tab_selpic_bg.png"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView;
    });
    self.image = [UIImage imageNamed:@"nav.png"];
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    self.backButton.userInteractionEnabled = YES;
    [self.backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    self.rebtn = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(rebtnclick)];
    self.navigationItem.rightBarButtonItem = _rebtn;
    [self.view addSubview:self.backgroundImageView];
    [self addChildViewController:self.leftuic];
    self.leftv.frame = self.view.bounds;
    [self.leftv addSubview:self.leftuic.view];
    [self.view addSubview:self.leftv];
    self.leftv.transform = CGAffineTransformMakeScale(0.7f,0.7f);
    self.leftv.center = CGPointMake(self.view.frame.size.width/2-90, self.leftv.center.y);
    [self addChildViewController:self.mainuic];
     self.mainv.frame = self.view.bounds;
    [self.mainv addSubview:self.mainuic.view];
    [self.view addSubview:self.mainv];
    self.conmainvview.frame = self.view.bounds;
    // Do any additional setup after loading the view.
}
- (void)backClick{
    if (self.mainv.center.x != self.view.frame.size.width){
        [self zidonghuisuoone:@"no"];
    }
}
- (void)rebtnclick{
    if (self.mainv.center.x == self.view.frame.size.width/2) {
        PViewController *view = [[PViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint ptCurr=[[touches anyObject] locationInView:self.mainv];
    self.startX = ptCurr.x;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.mainv.center.x <= self.view.frame.size.width && self.mainv.center.x >= self.view.frame.size.width/2) {
        CGPoint ptCurr=[[touches anyObject] locationInView:self.mainv];
        CGFloat len = ptCurr.x - self.startX;
        //conview
        CGFloat ban = self.view.frame.size.width / 2;
        CGFloat jfen = 0.3/ban;
        CGFloat narrow = self.mainv.center.x-ban;
        CGFloat connarrow = 1-narrow * jfen;
        //leftview
        CGFloat leftban = 90;
        CGFloat leftjfen = 0.3/leftban;
        CGFloat leftnarrow = self.leftv.center.x-self.view.frame.size.width/2+90;
        CGFloat lefttonarrow = 0.7 + leftnarrow * leftjfen;
        self.leftv.alpha = (lefttonarrow - 0.7)*100*0.0333+0.5;
         //动画
        [self fun:@"no" andLength:len andConNarrow:connarrow andLeftNarrow:lefttonarrow];
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.mainv.center.x < 3 *self.view.frame.size.width / 4) {
        [self zidonghuisuo:@"xiao"];
    }else if (self.mainv.center.x >= 3 *self.view.frame.size.width / 4 && self.mainv.center.x  < self.view.frame.size.width) {
        [self zidonghuisuo:@"da"];
    }else if (self.mainv.center.x  == self.view.frame.size.width){
        CGPoint ptCurr=[[touches anyObject] locationInView:self.mainv];
        CGFloat len = ptCurr.x - self.startX;
        if (len == 0) {
            [self zidonghuisuo:@"xiao"];
        }
    }
}
-(void)zidonghuisuoone:(NSString *)directionflag{
    CGFloat length = self.view.frame.size.width / 2;
    for (CGFloat len = 0.0f; len <= length; len++) {
        //conview
        CGFloat ban = self.view.frame.size.width / 2;
        CGFloat jfen = 0.3/ban;
        CGFloat narrow = self.mainv.center.x-ban;
        CGFloat connarrow = 1-narrow * jfen;
        //leftview
        CGFloat leftban = 90;
        CGFloat leftjfen = 0.3/leftban;
        CGFloat leftnarrow = self.leftv.center.x-self.view.frame.size.width/2+90;
        CGFloat lefttonarrow = 0.7 + leftnarrow * leftjfen;
        self.leftv.alpha = (lefttonarrow - 0.7)*100*0.0333+0.5;
        //动画
        [self fun:directionflag andLength:len andConNarrow:connarrow andLeftNarrow:lefttonarrow];
    }
}
-(void)zidonghuisuo:(NSString *)directionflag{
    CGFloat length = self.mainv.center.x - self.view.frame.size.width / 2;
    for (CGFloat len = 0.0f; len <= length; len++) {
        //conview
        CGFloat ban = self.view.frame.size.width / 2;
        CGFloat jfen = 0.3/ban;
        CGFloat narrow = self.mainv.center.x-ban;
        CGFloat connarrow = 1-narrow * jfen;
        //leftview
        CGFloat leftban = 90;
        CGFloat leftjfen = 0.3/leftban;
        CGFloat leftnarrow = self.leftv.center.x-self.view.frame.size.width/2+90;
        CGFloat lefttonarrow = 0.7 + leftnarrow * leftjfen;
        self.leftv.alpha = (lefttonarrow - 0.7)*100*0.0333+0.5;
        //动画
        [self fun:directionflag andLength:len andConNarrow:connarrow andLeftNarrow:lefttonarrow];
    }
}
-(void)fun:(NSString *)directionflag andLength:(CGFloat)len andConNarrow:(CGFloat)connarrow andLeftNarrow:(CGFloat)leftnarrow{
    int flag = 1;
    if ([directionflag isEqualToString:@"xiao"]) {
        flag = -1;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.mainv cache:YES];
    //缩小
    self.mainv.transform = CGAffineTransformMakeScale(connarrow,connarrow);
    self.leftv.transform = CGAffineTransformMakeScale(leftnarrow,leftnarrow);
    //平移
    CGFloat length = self.mainv.center.x + len * (flag);
    if (length > self.view.frame.size.width) {
        length = self.view.frame.size.width;
    }else if (length < self.view.frame.size.width/2) {
        length = self.view.frame.size.width/2;
    }
    if (self.mainv.center.x  == self.view.frame.size.width) {
        [self.mainv addSubview:self.conmainvview];
    }else{
        [self.conmainvview removeFromSuperview];
    }
    self.mainv.center = CGPointMake(length, self.mainv.center.y);
    CGFloat leftlength = self.leftv.center.x + len/2 * (flag);
    if (leftlength > self.view.frame.size.width/2) {
        leftlength = self.view.frame.size.width/2;
    }
    if (leftlength <= self.view.frame.size.width/2-90) {
        leftlength = self.view.frame.size.width/2-90;
    }
    self.leftv.center = CGPointMake(leftlength, self.leftv.center.y);
    [UIView commitAnimations];
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:self.image
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:self.image ];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bjcolor.png"]
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"top_bjcolor.png"] ];
    [[self.navigationController navigationBar] setFrame:CGRectMake(0,0, self.view.frame.size.width, 43)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
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
