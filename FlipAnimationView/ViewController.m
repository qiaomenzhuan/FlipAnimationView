//
//  ViewController.m
//  FlipAnimationView
//
//  Created by 杨磊 on 2018/9/11.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import "ViewController.h"
#import "FlipAnimationView.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface ViewController ()

@property (nonatomic, strong) UIButton           *button;
@property (nonatomic, strong) FlipAnimationView  *aniView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor       = [UIColor whiteColor];
    self.aniView.backgroundColor  = [UIColor whiteColor];
    self.button.backgroundColor     = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}

#pragma mark - action
- (void)flip
{
    self.aniView.title = self.button.currentTitle;
}

#pragma mark - getter
- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_button];
        _button.frame = CGRectMake((SCREEN_WIDTH - 50)/2.f, CGRectGetMaxY(self.aniView.frame) + 30, 50, 50);
        _button.layer.cornerRadius = 25;
        _button.clipsToBounds = YES;
        _button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [_button setTitle:@"反面" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:12];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(flip) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (FlipAnimationView *)aniView
{
    if (!_aniView)
    {
        _aniView = [[FlipAnimationView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 300)/2.f, (SCREEN_HEIGHT - 400)/2.f, 300, 400)];
        __weak typeof(self) weakSelf = self;
        _aniView.click = ^(NSString * _Nonnull result)
        {
            [weakSelf.button setTitle:result forState:UIControlStateNormal];
        };
        [self.view addSubview:_aniView];
    }
    return _aniView;
}


@end
