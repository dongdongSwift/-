//
//  BDJTabBar.m
//  百思不得姐
//
//  Created by 张冬 on 2016/11/21.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import "BDJTabBar.h"
#import "UIButton+Util.h"

@implementation BDJTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//重新实现初始化方法
- (instancetype)init {
    if (self = [super init]) {
        UIButton *addBtn = [UIButton createBtnTitle:nil bgImageName:@"tabBar_publish_icon" highlightBgImageName:@"tabBar_publish_click_icon" target:self action:@selector(publishAction)];
        [self addSubview:addBtn];
        
    }
    return  self;
}
- (void)publishAction {
    NSLog(@"发布了");
}
/*视图显示到父视图上面的时候
  手动调用了视图对象的layoutIfNeed方法
 */
//在当前对象的子视图重新布局的时候调用
- (void)layoutSubviews { 
    [super layoutSubviews];
    //修改按钮的位置
      //注意这里不能使用约束的方式修改(是frame的方法 加的tabbar)
    //按钮的高度
    CGFloat btnW = kScreenWidth/5;
    //按钮序号
    NSInteger index = 0 ;
    for (UIView *tmpView in self.subviews){
        
    if ([tmpView isKindOfClass:[UIButton class]]) {
        //发布按钮
   // tmpView.frame = CGRectMake(btnW*2, 4, btnW, 40);
        
        tmpView.center = CGPointMake(kScreenWidth/2, 49.0f/2);
        tmpView.size = CGSizeMake(40, 40);
        
    }else if([tmpView isKindOfClass:NSClassFromString(@"UITabBarButton")]){
        tmpView.width = btnW;
        if (index >= 2){
            //第3个开始，要添加发布按钮的宽度值
            tmpView.x = (index+1)*btnW;
        }else {
            tmpView.x = index*btnW;
        }
        index++;
    }
        
 }
    
}
@end
















