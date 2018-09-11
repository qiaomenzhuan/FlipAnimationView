//
//  SecondView.m
//  FlipAnimationView
//
//  Created by 杨磊 on 2018/9/11.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews
{
    UIImageView *imgView = [UIImageView new];
    imgView.frame = self.bounds;
    imgView.clipsToBounds = YES;
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.image = [UIImage imageNamed:@"car2"];
    [self addSubview:imgView];
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, self.frame.size.height - 50, self.frame.size.width, 50);
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = @"我是反面";
    [self addSubview:label];
}

@end
