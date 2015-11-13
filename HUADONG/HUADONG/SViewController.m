//
//  SViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/2.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "SViewController.h"
#import "ViewController.h"
#import "FViewController.h"
#import "MyScroView.h"
#import "ImageView.h"
#import "GetNewBtn.h"
#import "SSGBUIViewController.h"
#import "GPZNUIViewController.h"
#import "ZQDHUIViewController.h"
#import "LCCXUIViewController.h"
#import "JTHCUIViewController.h"
#import "ZXTSUIViewController.h"
#import "YYFWUIViewController.h"
#import "SYZXUIViewController.h"
#import "LoginViewController.h"
@interface SViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) UILabel *mytlabel;
@property (strong, nonatomic) UILabel *myinfolabel;
@property (strong, nonatomic) UINavigationBar *nabar;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) MyScroView *mytscrollView;
@property (strong, nonatomic) UIPageControl *pagecontrol;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic,strong)UIImageView *line;
@property (nonatomic,strong)UIImageView *myinfoview;
@property (nonatomic,strong)UIImageView *bommview;
@property (nonatomic, assign) CGRect prototypeRect;
@property (strong, nonatomic) UILabel *titlelabel;
@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initTopView:@"主页面123"];
    [self initScroImage];
    [self startTimer];
    [self initMytravel];
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
-(void)initTopView:(NSString *)titlename{
    self.titlelabel = [[UILabel alloc]init];
    self.titlelabel.text = titlename;
    self.titlelabel.textColor = [UIColor whiteColor];
    self.titlelabel.frame = CGRectMake(self.navigationController.view.frame.size.width/2-32,25, 100, 20);
    [self.nabar addSubview:self.titlelabel];
}
-(void)initScroImage{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 61, self.view.frame.size.width, 150)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5,0);
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    CGFloat imw = self.scrollView.frame.size.width;
    CGFloat imh = self.scrollView.frame.size.height;
    CGFloat imy = 0.0f;
    CGFloat imx = 0;
    NSInteger total = 5;
    for (int k = 0; k < total; k++) {
        UIImageView *imageview = [[UIImageView alloc]init];
        imx = k * imw;
        imageview.frame = CGRectMake(imx, imy, imw, imh);
        NSString *imname = [NSString stringWithFormat:@"qingdaobeizhanshouye0%d.png",k+1];
        imageview.image = [UIImage imageNamed:imname];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self.scrollView addSubview:imageview];
    }
    
    self.pagecontrol = [[UIPageControl alloc]init];
    self.pagecontrol.numberOfPages = total;
    CGSize size = [self.pagecontrol sizeForNumberOfPages:total];
    self.pagecontrol.bounds = CGRectMake(0, 0, size.width, size.height);
    self.pagecontrol.center = CGPointMake(self.view.center.x, imh + 50);
    self.pagecontrol.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pagecontrol.pageIndicatorTintColor = [UIColor yellowColor];
    [self.view addSubview:self.pagecontrol];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 2) {
        if (scrollView.contentOffset.y > 0 && scrollView.contentOffset.y <= 90) {
            [self.mytscrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:YES];
        }
    }else{
       self.pagecontrol.currentPage = scrollView.contentOffset.x /scrollView.frame.size.width;
    }
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView.tag == 2) {
        
    }else{
        [self stopTimer];
    }
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (scrollView.tag == 2) {

    }else{
        [self startTimer];
    }
}
-(void)nextImage{
    int nextpage = 0;
    int currpage = (int)self.pagecontrol.currentPage;
    if (currpage != 4) {
        nextpage = currpage + 1;
    }
    CGFloat nextimx = nextpage * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(nextimx, 0) animated:YES];
    self.pagecontrol.currentPage = nextpage;
}
-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}
-(void)stopTimer{
    [self.timer invalidate];
}

-(void)initMytravel{
    self.mytlabel = [[UILabel alloc]initWithFrame:CGRectMake(5, self.scrollView.frame.size.height+70, 100, 10)];
    self.mytlabel.text = @"我的行程";
    self.mytlabel.textColor = [UIColor blueColor];
    [self.view addSubview:self.mytlabel];
    
    CGRect frame = CGRectMake(0, self.scrollView.frame.size.height+90, self.view.frame.size.width, 430);
    self.mytscrollView = [[MyScroView alloc]initWithFrame:frame];
    self.mytscrollView.contentSize = CGSizeMake(0,450);
    self.mytscrollView.pagingEnabled = YES;
    self.mytscrollView.delegate = self;
    self.mytscrollView.tag = 2;
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, 130);
    imageview.image = [UIImage imageNamed:@"login_weather12.png"];
    imageview.userInteractionEnabled = YES;
    
    self.prototypeRect = CGRectMake(40, imageview.frame.size.height-25, 100, 10);
    GetNewBtn *addmytinfobtn = [[GetNewBtn alloc]getNewBtn:@"请添加行程" andCgrect:self.prototypeRect];
    addmytinfobtn.tag = 1;
    [addmytinfobtn  addTarget:self action:@selector(imageclick:) forControlEvents:UIControlEventTouchUpInside];
    [imageview addSubview:addmytinfobtn];
    
    self.prototypeRect = CGRectMake(imageview.frame.size.width/2+40, imageview.frame.size.height-25, 100, 10);
    GetNewBtn *newmytinfobtn = [[GetNewBtn alloc]getNewBtn:@"刷新行程" andCgrect:self.prototypeRect];
    newmytinfobtn.tag = 2;
    [newmytinfobtn  addTarget:self action:@selector(imageclick:) forControlEvents:UIControlEventTouchUpInside];
    [imageview addSubview:newmytinfobtn];
    [self.mytscrollView addSubview:imageview];
   
    self.myinfoview = [[UIImageView alloc]init];
    self.myinfoview.image = [UIImage imageNamed:@"list_3yeqian_n.png"];
    self.myinfoview.frame = CGRectMake(0,imageview.frame.size.height,self.view.frame.size.width, 30);
    self.myinfolabel = [[UILabel alloc]initWithFrame:CGRectMake(5,10, 100, 10)];
    self.myinfolabel.text = @"查询信息";
    self.myinfolabel.textColor = [UIColor blueColor];
    [self.myinfoview addSubview:self.myinfolabel];
    [self.mytscrollView addSubview:self.myinfoview];

    
    UIImageView *imageviewone =[[UIImageView alloc]initWithFrame:CGRectMake(0,imageview.frame.size.height+30, self.view.frame.size.width, 355)];
    imageviewone.image = [UIImage imageNamed:@""];
    imageviewone.backgroundColor = [UIColor whiteColor];
    imageviewone.userInteractionEnabled = YES;
    
    //mageviewtwo;
    CGFloat hfen = self.view.frame.size.width / 4;
    CGFloat ww = 0;
    CGFloat hh = 0;
    NSArray *namearray = [[NSArray alloc]initWithObjects:@"实时广播",@"购票指南",@"站区导航",@"列车查询",@"交通换乘",@"咨询投诉",@"预约服务",@"商业中心", nil];
    for (int k = 0; k < 8; k++) {
        hh = k;
        if (k >= 4) {
            ww = 120;
            hh = k - 4;
        }
        NSString *imagename = [NSString stringWithFormat:@"index_pic0%d_a.png",k+1];
        ImageView *imageviewtwo = [[ImageView alloc]getImageView:(hfen*hh)+20 andh:ww+20 andImageName:imagename andCoName:namearray[k] andImageFlag:k];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 50, 50);
        btn.tag = k;
        [btn addTarget:self action:@selector(clickimagebtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
        [imageviewtwo addSubview:btn];
        [imageviewone addSubview:imageviewtwo];
    }
    self.line = [[UIImageView alloc]init];
    self.line.image = [UIImage imageNamed:@"line.png"];
    self.line.frame = CGRectMake(30,imageviewone.frame.size.height/2-60, imageviewone.frame.size.width - 60 , 2);
    [imageviewone addSubview:self.line];
    [self.mytscrollView addSubview:imageviewone];
    
    self.myinfoview = [[UIImageView alloc]init];
    self.myinfoview.image = [UIImage imageNamed:@"list_3yeqian_n.png"];
    self.myinfoview.frame = CGRectMake(0,imageviewone.frame.size.height+40,self.view.frame.size.width, 30);
    [self.mytscrollView addSubview:self.myinfoview];
    [self.view addSubview:self.mytscrollView];

}
-(void)imageclick:(UIButton *)imagebtn{
    if (imagebtn.tag == 1) {
        NSLog(@"addmytinfo");
    }else if(imagebtn.tag == 2){
        NSLog(@"newmytinfo");
    }
}
-(void)clickimagebtn:(UIButton *)imagebtn{
    UIViewController *showcv;
    if (imagebtn.tag == 0) {
        showcv = [[SSGBUIViewController alloc]init];
    }else if(imagebtn.tag == 1){
        showcv = [[GPZNUIViewController alloc]init];
    }else if(imagebtn.tag == 2){
        showcv = [[ZQDHUIViewController alloc]init];
    }else if(imagebtn.tag == 3){
        showcv = [[LCCXUIViewController alloc]init];
    }else if(imagebtn.tag == 4){
        showcv = [[JTHCUIViewController alloc]init];
    }else if(imagebtn.tag == 5){
        showcv = [[LoginViewController alloc]init];//[[ZXTSUIViewController alloc]init];
    }else if(imagebtn.tag == 6){
        showcv = [[YYFWUIViewController alloc]init];
    }else if(imagebtn.tag == 7){
        showcv = [[SYZXUIViewController alloc]init];
    }
    if (showcv != nil) {

        [self.navigationController pushViewController:showcv animated:YES];
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
