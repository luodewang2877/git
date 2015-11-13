
//
//  CellTabel.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/6.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "CellTabel.h"
#import "CellModel.h"
@implementation CellTabel
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self){
        self.imageviewone = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageviewone];
        self.imageviewtwo = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageviewtwo];
        self.title  = [[UILabel alloc]init];
        [self.contentView addSubview:self.title];
        self.weburl = [[UILabel alloc]init];
        [self.contentView addSubview:self.weburl];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.imageviewone.frame = CGRectMake(5,height/4, height/2, height/2);
    self.title.frame = CGRectMake(height/2+20, 15, 100, 30);
    self.imageviewtwo.frame = CGRectMake(width-20, 15, 10, 10);
}
-(void)setCellmodel:(CellModel *)cellmodel{
    self.imageviewone.image = [UIImage imageNamed:cellmodel.imagename];
    self.imageviewtwo.image = [UIImage imageNamed:@"list_arrownext_n.png"];
    self.title.text  = cellmodel.title;
    self.weburl.text = cellmodel.weburl;
}
@end
