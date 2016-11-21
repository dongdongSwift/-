//
//  UIButton+Util.h
//  百思不得姐
//
//  Created by 张冬 on 2016/11/21.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Util)
+ (UIButton *)createBtnTitle:(NSString *)title bgImageName:(NSString *)bgImageName highlightBgImageName:(NSString *)highlightBgImageName target:(id)target action:(SEL)action;

@end
