//
//  SSGBUIViewController.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/5.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "SSGBUIViewController.h"
#import "CellTabel.h"
@interface SSGBUIViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
///@brife 整个视图的大小
@property (assign) CGRect mViewFrame;
///@brife 下方的ScrollView
@property (strong, nonatomic) UIScrollView *myscrollView;
///@brife 下面滑动的View
@property (strong, nonatomic) UIView *slideView;
@property (strong, nonatomic) UIView *tview;
@property (assign, readwrite, nonatomic) int viewnumber;
@property (assign, readwrite, nonatomic) int currviewnumber;
@property (strong, nonatomic) NSArray *namearray;

@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *backButtonone;
@property (strong, nonatomic) UILabel *titlelabel;

@property (nonatomic,strong) UITableView *tableviewone;
@property (nonatomic,strong) NSMutableArray *tablearray;
@property (nonatomic,strong) CellModel *cellmodel;

@end

@implementation SSGBUIViewController
-(void)viewDidLoad{
    [self initTopView:@"实时广播"];
    self.namearray = [[NSArray alloc]initWithObjects:@"实时广播",@"温馨提示",@"爱心服务", nil];
    [self initwithFrame:self.view.frame withCount:(int)self.namearray.count andNameRray:self.namearray];
    [self initTabelView];
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
-(instancetype)initwithFrame:(CGRect )frame withCount:(int)count andNameRray:(NSArray *)namearray{
    _mViewFrame = frame;
    _viewnumber = count;
    [self initScrollView];
    [self initTopTabs:namearray];
    [self initSlideView];
    return self;
}
-(void) initScrollView{
    self.myscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _mViewFrame.origin.y, _mViewFrame.size.width, _mViewFrame.size.height - 5)];
    self.myscrollView.contentSize = CGSizeMake(_mViewFrame.size.width * _viewnumber, _mViewFrame.size.height - 60);
    self.myscrollView.backgroundColor = [UIColor whiteColor];
    self.myscrollView.pagingEnabled = YES;
    self.myscrollView.delegate = self;
    [self.view addSubview:self.myscrollView];
}
-(void) initTopTabs:(NSArray *)namearray{
    CGFloat width = _mViewFrame.size.width / _viewnumber;
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.image = [UIImage imageNamed:@"list_3yeqian_n.png"];
    imageview.frame = CGRectMake(0, 0, _mViewFrame.size.width, 30);
    self.tview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mViewFrame.size.width, 30)];
    [self.tview addSubview:imageview];
    for (int i = 0; i < _viewnumber; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 13, width, 5)];
        button.tag = i;
        [button setTitle:namearray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tabButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.tview addSubview:button];
    }
    [self.view addSubview:self.tview];
}
-(void) initSlideView{
    CGFloat width = _mViewFrame.size.width / _viewnumber;
    _slideView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, width, 2)];
    [_slideView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:_slideView];
}

-(void) tabButton: (UIButton *) sender{
    UIButton *button = sender;
    [self.myscrollView setContentOffset:CGPointMake(button.tag * _mViewFrame.size.width, 0) animated:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGRect frame = _slideView.frame;
    frame.origin.x = scrollView.contentOffset.x/_viewnumber;
    _slideView.frame = frame;
    int numbertable = (int)scrollView.contentOffset.x / scrollView.frame.size.width;
    [self setTviewColor:numbertable];
    UITableView *tableview;
    if ((numbertable + 1) > self.tablearray.count) {
        tableview = [[UITableView alloc]init];
        [self.tablearray addObject:tableview];
        tableview.delegate   = self;
        tableview.dataSource = self;
        [self.myscrollView addSubview:tableview];
    }else{
        tableview = self.tablearray[numbertable];
    }
    tableview.frame = CGRectMake(self.myscrollView.frame.size.width * numbertable, self.tview.frame.size.height, self.mViewFrame.size.width, self.mViewFrame.size.height);
}

#pragma - tableview函数
-(void)setTviewColor:(int)btntag{
    for (id btn in [self.tview subviews]) {
        if ([btn isKindOfClass:[UIButton class]]) {
            UIButton *button = btn;
            if (button.tag == btntag) {
                [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }else{
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
    }
}
-(void)initTabelView{
    self.tablearray = [[NSMutableArray alloc]init];
    self.tableviewone = [[UITableView alloc]init];
    [self.tablearray addObject:self.tableviewone];
    self.tableviewone.frame = CGRectMake(0 , self.tview.frame.size.height, self.mViewFrame.size.width, self.mViewFrame.size.height);
    self.tableviewone.delegate   = self;
    self.tableviewone.dataSource = self;
    [self.myscrollView addSubview:self.tableviewone];
    self.cellmodel = [[CellModel alloc]initCellModelAndWebUrl:@"1222" andImageName:@"list_3yeqian_n.png" andTitle:@"我的的我的我的我哦"];
    [self setTviewColor:0];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 21;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *celllistflag = @"celllistflag";
    CellTabel *cell = [tableView dequeueReusableCellWithIdentifier:celllistflag];
    if (!cell) {
        cell = [[CellTabel alloc]initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:celllistflag];
    }
    cell.cellmodel = self.cellmodel;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
@end
