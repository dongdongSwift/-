//
//  EssenceImageCell.h
//  百思不得姐
//
//  Created by 张冬 on 2016/11/22.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDJEssenceDetail;
@interface EssenceTextCell : UITableViewCell

//数据
@property (nonatomic,strong)BDJEssenceDetail *detailModel;

//便利才创建cell的方法
+ (EssenceTextCell *)textCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexpath withModel:(BDJEssenceDetail *)detailModel;

@end
