//
//  GetNewBtn.h
//  HUADONG
//
//  Created by 罗德望 on 15/11/5.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetNewBtn : UIButton
@property (nonatomic,strong)UIButton *newbtn;
@property (nonatomic,strong)NSString *textname;
@property (nonatomic,strong)UIImageView *newimageview;
@property (nonatomic,strong)UILabel *newlabel;
-(id)getNewBtn:(NSString *)name andCgrect:(CGRect)btnframe;
-(id)getNewMBtn:(NSString *)name andCgrect:(CGRect)btnframe andImageoneName:(NSString *)imagenameone andImagetwoName:(NSString *)imagenametwo;
-(id)getNewSBtn:(NSString *)name andCgrect:(CGRect)btnframe andImageName:(NSString *)imagename;
@end
