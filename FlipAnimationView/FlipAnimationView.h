//
//  FlipAnimationView.h
//  FlipAnimationView
//
//  Created by 杨磊 on 2018/9/11.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^stringBlock)(NSString *result);

NS_ASSUME_NONNULL_BEGIN

@interface FlipAnimationView : UIView

@property (nonatomic,  copy)NSString *title;
@property (nonatomic,  copy)stringBlock click;

@end

NS_ASSUME_NONNULL_END
