//
//  CellModel.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/6.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
-(CellModel *)initCellModelAndWebUrl:(NSString *)weburl andImageName:(NSString *)imagename andTitle:(NSString *)title{
    if (self == [self init]) {
        self.weburl    = weburl;
        self.imagename = imagename;
        self.title     = title;
    }
    return self;
}
+(CellModel *)staticiinitCellModelAndWebUrl:(NSString *)weburl andImageName:(NSString *)imagename andTitle:(NSString *)title{
    CellModel *cellmodel = [[CellModel alloc]initCellModelAndWebUrl:weburl andImageName:imagename andTitle:title];
    return cellmodel;
}
@end
