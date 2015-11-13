//
//  ImageView.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/4.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView
-(id)getImageView:(CGFloat)w andh:(CGFloat)h andImageName:(NSString *)imagename andCoName:(NSString *)coname andImageFlag:(int)k{
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(w, h, 50, 50)];
    self.imageview.image = [UIImage imageNamed:imagename];
    self.coname = [[UILabel alloc]init];
    self.coname.frame = CGRectMake(-7, self.imageview.frame.size.height+5, 100, 20);
    self.coname.text  = coname;
    [self.imageview addSubview:self.coname];
    self.btn.userInteractionEnabled = YES;
    self.imageview.userInteractionEnabled = YES;
    return self.imageview;
}
@end
