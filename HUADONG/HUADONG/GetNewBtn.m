//
//  GetNewBtn.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/5.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "GetNewBtn.h"

@implementation GetNewBtn
-(id)getNewBtn:(NSString *)name andCgrect:(CGRect)btnframe{
    self.newbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.newbtn setTitle:name forState:UIControlStateNormal];
    [self.newbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.newbtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.newbtn.frame = CGRectMake(btnframe.origin.x,btnframe.origin.y, btnframe.size.width, btnframe.size.height);
    return self.newbtn;
}
-(id)getNewMBtn:(NSString *)name andCgrect:(CGRect)btnframe andImageoneName:(NSString *)imagenameone andImagetwoName:(NSString *)imagenametwo{
    self.newbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.newbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.newbtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.newbtn.frame = CGRectMake(btnframe.origin.x,btnframe.origin.y, btnframe.size.width, btnframe.size.height);
    self.newimageview = [[UIImageView alloc]initWithFrame:CGRectMake(0,5,30,30)];
    self.newimageview.image = [UIImage imageNamed:imagenameone];
    [self.newbtn addSubview:self.newimageview];
    self.newlabel = [[UILabel alloc]initWithFrame:CGRectMake(self.newimageview.frame.size.width + 5,5,70,30)];
    self.newlabel.text = name;
    [self.newbtn addSubview:self.newlabel];
    self.newimageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.newbtn.frame.size.width-5,15,10,10)];
    self.newimageview.image = [UIImage imageNamed:imagenametwo];
    [self.newbtn addSubview:self.newimageview];
    return  self.newbtn;
}
-(id)getNewSBtn:(NSString *)name andCgrect:(CGRect)btnframe andImageName:(NSString *)imagename{
    self.newbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.newbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.newbtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.newbtn.frame = CGRectMake(btnframe.origin.x,btnframe.origin.y, btnframe.size.width, btnframe.size.height);
    self.newimageview  = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,50,50)];
    [self.newbtn addSubview:self.newimageview];
    self.newlabel = [[UILabel alloc]initWithFrame:CGRectMake(55,0,50,20)];
    self.newlabel.text = name;
    [self.newbtn addSubview:self.newlabel];
    return  self.newbtn;
}
@end
