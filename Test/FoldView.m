//
//  FoldView.m
//  Test
//
//  Created by beik on 8/6/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import "FoldView.h"

@implementation FoldView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializer];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initializer];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializer];
    }
    return self;
}


- (void)initializer{
    self.layer.anchorPoint = CGPointMake(0.5f, 0.0f);
    self.layer.position = CGPointMake(self.layer.position.x, self.layer.position.y - (self.frame.size.height * 0.5));
    self.layer.transform = CATransform3DMakeRotation(-M_PI_2, 1, 0, 0);
}


- (void)showFoldAnimation{
    [UIView animateWithDuration:0.35 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.0f/350;
        
        transform = CATransform3DRotate(transform, M_PI_4 * 0.25, 1.0, 0, 0);
        self.layer.transform = transform;
        
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
            CATransform3D transform = CATransform3DIdentity;
            transform.m34 = -1.0f/650;
            transform = CATransform3DRotate(transform, 0, 1.0, 0, 0);
            self.layer.transform = transform;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
