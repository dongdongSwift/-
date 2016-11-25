//
//  BDJMenu.h
//  百思不得姐
//
//  Created by 张冬 on 2016/11/23.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class BDJDefault;
@protocol BDJMenusList;
@interface BDJMenu : JSONModel
@property (nonatomic,strong)BDJDefault<Optional> *default_menu;
@property (nonatomic,strong)NSArray<BDJMenusList> *menus;
@end


@interface BDJDefault : JSONModel
@property (nonatomic,copy)NSString<Optional> *initial;
@property (nonatomic,copy)NSString<Optional> *offline_day_3;
@property (nonatomic,copy)NSString<Optional> *offline_day_7;
@end

@protocol BDJSubMenu;
@interface BDJMenusList : JSONModel
@property (nonatomic,copy)NSString<Optional> *name;
@property (nonatomic,strong)NSArray<BDJSubMenu> *submenus;
@end

@interface  BDJSubMenu: JSONModel
@property (nonatomic,copy)NSString<Optional> *entrytype;
@property (nonatomic,copy)NSString<Optional> *god_topic_type;
@property (nonatomic,copy)NSString<Optional> *name;
@property (nonatomic,copy)NSString<Optional> *recsys_url;
@property (nonatomic,copy)NSString<Optional> *type;
@property (nonatomic,copy)NSString<Optional> *url;
@end