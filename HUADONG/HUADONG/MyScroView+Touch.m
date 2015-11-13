//
//  MyScroView+Touch.m
//  HUADONG
//
//  Created by 罗德望 on 15/11/4.
//  Copyright (c) 2015年 罗德望. All rights reserved.
//

#import "MyScroView+Touch.h"

@implementation MyScroView (Touch)

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint ptCurr = [[touches anyObject] locationInView:self];
    self.startX = ptCurr.x;
    [[self nextResponder]touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self nextResponder]touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint ptCurr = [[touches anyObject] locationInView:self];
    if (ptCurr.x == self.startX) {
    }else{
        [[self nextResponder]touchesEnded:touches withEvent:event];
        [super touchesEnded:touches withEvent:event];
    }
}
@end
