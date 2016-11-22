//
//  BDJEssenceModel.h
//  百思不得姐
//
//  Created by 张冬 on 2016/11/22.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class BDJEssenceInfo;

@protocol BDJEssenceDetail;

@interface BDJEssenceModel : JSONModel

@property (nonatomic,strong)BDJEssenceInfo<Optional> *info;//字典

@property (nonatomic,strong)NSArray<BDJEssenceDetail> *list; //数组

@end


@interface BDJEssenceInfo : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *count;
@property (nonatomic,strong)NSNumber<Optional> *np;

@end



@protocol  BDJEssenceTags;
@protocol  BDJEssenceComment ;
@class BDJEssenceUser;
@class BDJEssenceVideo;
@interface BDJEssenceDetail : JSONModel

@property (nonatomic,copy)NSString<Optional> *bookmark;
@property (nonatomic,copy)NSString<Optional> *comment;
@property (nonatomic,strong)NSNumber<Optional> *down;

@property (nonatomic,strong)NSNumber<Optional> *forward;
@property (nonatomic,copy)NSString<Optional> *detailId;
@property (nonatomic,copy)NSString<Optional> *passtime;

@property (nonatomic,copy)NSString<Optional> *share_url;
@property (nonatomic,strong)NSNumber<Optional> *status;
@property (nonatomic,strong)NSArray<BDJEssenceTags> *tags; //数组

@property (nonatomic,copy)NSString<Optional> *text;
@property (nonatomic,strong)NSArray<BDJEssenceComment > *top_comments; //数组
@property (nonatomic,copy)NSString<Optional> *type;

@property (nonatomic,strong)BDJEssenceUser<Optional> *u; //字典
@property (nonatomic,strong)NSString<Optional> *up;
@property (nonatomic,strong)BDJEssenceVideo<Optional> *video;//字典

@end


@interface BDJEssenceTags : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *tagId;
@property (nonatomic,copy)NSString<Optional> *name;

@end


@class BDJEssenceUser;
@protocol NSString;
@interface BDJEssenceComment : JSONModel

@property (nonatomic,copy)NSString<Optional> *cmt_type;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,strong)NSNumber<Optional> *commentId;

@property (nonatomic,strong)NSNumber<Optional> *like_count;
@property (nonatomic,copy)NSString<Optional> *passtime;
@property (nonatomic,strong)NSNumber<Optional> *precid;

@property (nonatomic,strong)NSNumber<Optional> *preuid;
@property (nonatomic,strong)NSNumber<Optional> *status;
@property (nonatomic,strong)BDJEssenceUser<Optional> *u; //

@property (nonatomic,strong)NSNumber<Optional> *voicetime;
@property (nonatomic,copy)NSString<Optional> *voiceuri;
@end

@interface BDJEssenceUser : JSONModel

@property (nonatomic,strong)NSArray<NSString,Optional> *header;
@property (nonatomic,strong)NSNumber<Optional> *is_vip;
@property (nonatomic,copy)NSString<Optional> *name;

@property (nonatomic,copy)NSString<Optional> *room_icon;
@property (nonatomic,copy)NSString<Optional> *room_name;
@property (nonatomic,copy)NSString<Optional> *room_role;

@property (nonatomic,copy)NSString<Optional> *room_url;
@property (nonatomic,copy)NSString<Optional> *sex;
@property (nonatomic,copy)NSString<Optional> *uid;

@property (nonatomic,strong)NSNumber<Optional> *voicetime;
@property (nonatomic,copy)NSString<Optional> *voiceuri;

@end


@interface BDJEssenceVideo : JSONModel

@property (nonatomic,copy)NSArray<NSString,Optional> *download;
@property (nonatomic,strong)NSNumber<Optional> *duration;
@property (nonatomic,strong)NSNumber<Optional> *height;

@property (nonatomic,strong)NSNumber<Optional> *playcount;
@property (nonatomic,strong)NSNumber<Optional> *playfcount;
@property (nonatomic,copy)NSArray<NSString,Optional> *thumbnail;

@property (nonatomic,copy)NSArray<NSString,Optional> *thumbnail_small;
@property (nonatomic,copy)NSArray<NSString,Optional> *video;
@property (nonatomic,strong)NSNumber<Optional> *width;

@end


