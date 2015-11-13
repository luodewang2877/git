//
//  CellModel.h
//  HUADONG
//
//  Created by 罗德望 on 15/11/6.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property (nonatomic,strong)NSString *weburl;
@property (nonatomic,strong)NSString *imagename;
@property (nonatomic,strong)NSString *title;
-(CellModel *)initCellModelAndWebUrl:(NSString *)weburl andImageName:(NSString *)imagename andTitle:(NSString *)title;
+(CellModel *)staticiinitCellModelAndWebUrl:(NSString *)weburl andImageName:(NSString *)imagename andTitle:(NSString *)title;
@end
