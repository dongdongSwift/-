//
//  BDJDownloader.h
//  百思不得姐
//
//  Created by 张冬 on 2016/11/22.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import <Foundation/Foundation.h>

//将闭包定义为一个类型
//typedef void(^SUCCESSBLOCK) (NSData *data);
//typedef void(^FAILBLOCK) (NSData *error);

@interface BDJDownloader : NSObject

//这里参数名可以省略
+ (void)downloadWithURLString:(NSString *)urlString success:(void(^)(NSData *data))finishBlock fail:(void(^)(NSError *error))failBlock;
//+ (void)downloadWithURLString:(NSString *)urlString success:(void(^)(NSData *))finishBlock fail:(void(^)(NSError *))failBlock;

//也可以像下面这样写
//+ (void)downdownloadWithURLString:(NSString *)urlString success:(SUCCESSBLOCK)finishBlock fail:(FAILBLOCK)failBlock;
@end
