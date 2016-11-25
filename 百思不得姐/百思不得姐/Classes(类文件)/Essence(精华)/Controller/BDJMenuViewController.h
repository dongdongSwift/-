//
//  BDJMenuViewController.h
//  百思不得姐
//
//  Created by 张冬 on 2016/11/23.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import "BaseViewController.h"


//精华和最新的公共父类
@interface BDJMenuViewController : BaseViewController

//标题例表数据不一样
@property (nonatomic,strong)NSArray *subMenus;
//右边按钮的图片
@property (nonatomic,copy)NSString *rightImageName;
//右边按钮的高亮的图片
@property (nonatomic,copy)NSString *rightHLImageName;
//右边按钮的点击事件
@property (nonatomic,strong)void (^rightBtnBlock)(void);
@end
