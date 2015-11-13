//
//  ViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/2.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
///@brife 整个视图的大小
@property (assign) CGRect mViewFrame;
///@brife 下方的ScrollView
@property (strong, nonatomic) UIScrollView *scrollView;
///@brife 下面滑动的View
@property (strong, nonatomic) UIView *slideView;
@property (strong, nonatomic) UIView *uione;
@property (strong, nonatomic) UIView *uitwo;

@end

@implementation ViewController
-(instancetype)initwithFrame:(CGRect )frame withCount:(NSInteger)count{
    _mViewFrame = frame;
    [self initScrollView];
    [self initSlideView];
    [self initTopTabs];
    [self initView];
    return self;
}
-(void) initView{
    _uione = [[UIView alloc]init];
    _uione.backgroundColor = [UIColor greenColor];
    _uione.frame = CGRectMake(0, 30, _mViewFrame.size.width, _mViewFrame.size.height);
    [_scrollView addSubview:_uione];
    _uitwo = [[UIView alloc]init];
    _uitwo.backgroundColor = [UIColor blueColor];
    _uitwo.frame = CGRectMake(_mViewFrame.size.width, 30, _mViewFrame.size.width, _mViewFrame.size.height);
    [_scrollView addSubview:_uitwo];
}
-(void) initSlideView{
    CGFloat width = _mViewFrame.size.width / 2;
    _slideView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, width, 5)];
    [_slideView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_slideView];
}
-(void) initScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _mViewFrame.origin.y, _mViewFrame.size.width, _mViewFrame.size.height - 5)];
    _scrollView.contentSize = CGSizeMake(_mViewFrame.size.width * 2, _mViewFrame.size.height - 60);
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
}
-(void) initTopTabs{
    CGFloat width = _mViewFrame.size.width / 2;
    for (int i = 0; i < 2; i ++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * width, 60, width, 30)];
        view.backgroundColor = [UIColor lightGrayColor];
        if (i % 2) {
            view.backgroundColor = [UIColor grayColor];
        }
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 15, width, 5)];
        button.tag = i;
        [button setTitle:[NSString stringWithFormat:@"按钮%d", i+1] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tabButton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        [self.view addSubview:view];
    }
}
-(void) tabButton: (id) sender{
    UIButton *button = sender;
    [_scrollView setContentOffset:CGPointMake(button.tag * _mViewFrame.size.width, 0) animated:YES];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([_scrollView isEqual:scrollView]) {
        CGRect frame = _slideView.frame;
        frame.origin.x = scrollView.contentOffset.x/2;
        _slideView.frame = frame;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initwithFrame:self.view.frame withCount:2];
    self.navigationItem.title = @"滑动切换111";
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back-over"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(w - 3 * w / 4,h - 9* h / 10, 45, 30);
    backButton.userInteractionEnabled = YES;
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.rightBarButtonItem = backButtonItem;
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
