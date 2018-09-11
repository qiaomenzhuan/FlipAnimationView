//
//  FlipAnimationView.m
//  FlipAnimationView
//
//  Created by 杨磊 on 2018/9/11.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import "FlipAnimationView.h"
#import "SecondView.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface FlipAnimationView()

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) SecondView *secondView;

@end

@implementation FlipAnimationView

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
    self.firstView.backgroundColor  = [UIColor whiteColor];
    self.secondView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - setter
- (void)setTitle:(NSString *)title
{
    _title = title;
    
    if ([title isEqualToString:@"反面"])
    {
        if (self.click)
        {
            self.click(@"正面");
        }
        [UIView transitionFromView:self.firstView toView:self.secondView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            NSLog(@"翻转到了正面");
        }];
    }else
    {
        if (self.click)
        {
            self.click(@"反面");
        }
        [UIView transitionFromView:self.secondView toView:self.firstView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            NSLog(@"翻转到了反面");
        }];
    }
}

#pragma mark - getter

- (UIView *)firstView
{
    if (!_firstView)
    {
        _firstView = [UIView new];
        _firstView.frame = self.bounds;
        
        UIImageView *imgView = [UIImageView new];
        imgView.frame = _firstView.bounds;
        imgView.clipsToBounds = YES;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.image = [UIImage imageNamed:@"car1"];
        [_firstView addSubview:imgView];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(0, self.frame.size.height - 50, self.frame.size.width, 50);
        label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.text = @"我是正面";
        [_firstView addSubview:label];
        [self addSubview:_firstView];
        _firstView.layer.cornerRadius = 5;
        _firstView.clipsToBounds = YES;
    }
    return _firstView;
}

- (SecondView *)secondView
{
    if (!_secondView)
    {
        _secondView = [[SecondView alloc] initWithFrame:self.bounds];
        _secondView.layer.cornerRadius = 5;
        _secondView.clipsToBounds = YES;
    }
    return _secondView;
}

@end
