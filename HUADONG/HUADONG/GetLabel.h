//
//  GetLabel.h
//  HUADONG
//
//  Created by 罗德望 on 15/11/5.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetLabel : UILabel
@property (nonatomic,strong)NSString *newlabelname;
@property (nonatomic,strong)UILabel *newlabel;
-(id)getNewLabel:(NSString *)labelname;
@end
