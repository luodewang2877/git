//
//  ImageView.h
//  HUADONG
//
//  Created by 罗德望 on 15/11/4.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendDel<NSObject>
@required
-(void)sendfun;
@end
@interface ImageView : UIImageView
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,strong)UILabel *coname;
@property (nonatomic,strong)UIButton *btn;
-(id)getImageView:(CGFloat)w andh:(CGFloat)h andImageName:(NSString *)imagename andCoName:(NSString *)coname andImageFlag:(int)k;
@property(nonatomic,assign)id<SendDel>sendDel;
@end
