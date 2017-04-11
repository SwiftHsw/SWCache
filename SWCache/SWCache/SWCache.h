//
//  SWCache.h
//  SWCache
//
//  Created by  677676  on 17/4/11.
//  Copyright © 2017年 艾腾软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYCache.h"
typedef void (^YYCacheToolBlock)(id data);


@interface SWCache : NSObject
@property(nonatomic,strong) YYCache *yyCache;

@property (nonatomic, copy) YYCacheToolBlock yyCacheToolBlock;
/**
 单例类
 */
+ (instancetype)shareManager;

/**
 同步存储id类型数据

 @param data 数据
 @param key key值
 */
-(void)sw_SetSynData:(id)data withKey:(NSString *)key;

/**
 同步读取数据

 @param key key值
 @return id
 */
-(instancetype)sw_GetSynDataWithKey:(NSString *)key;

/**
 异步存储id类型数据

 @param data 数据
 @param key key值
 */
-(void)sw_SetAsynData:(id)data withKey:(NSString *)key;


/**
 异步读取数据(带Block回调)

 @param key key
 @param block 回调的值
 */
-(void)sw_GetAsynDataWithKey:(NSString *)key WithBlock:(YYCacheToolBlock)block;


/**
 删除缓存

 @param key key值
 */
-(void)sw_CleanDataWithKey:(NSString *)key;
@end
