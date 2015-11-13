//
//  CellTabel.h
//  HUADONG
//
//  Created by 罗德望 on 15/11/6.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface CellTabel : UITableViewCell
@property (nonatomic,strong)CellModel *cellmodel;
@property (nonatomic,strong)UIImageView *imageviewone;
@property (nonatomic,strong)UIImageView *imageviewtwo;
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *weburl;
@end
