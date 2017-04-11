//
//  SWCache.m
//  SWCache
//
//  Created by  677676  on 17/4/11.
//  Copyright © 2017年 艾腾软件. All rights reserved.
//

#import "SWCache.h"

@implementation SWCache

-(YYCache *)yyCache{
    if (!_yyCache) {
        _yyCache =[YYCache cacheWithName:@"appData"];
    }
    return _yyCache;
}


+(instancetype)shareManager{
    static SWCache * swcache = nil;
    static dispatch_once_t onec;
    dispatch_once(&onec, ^{
        swcache = [SWCache new];
    });
    return swcache;
}


#pragma -mark 同步方式
-(void)sw_SetSynData:(id)data withKey:(NSString *)key{
    [self.yyCache setObject:data forKey:key];
    NSLog(@"同步写入缓存成功！!");
}
-(instancetype)sw_GetSynDataWithKey:(NSString *)key{
    BOOL isContains=[self.yyCache containsObjectForKey:key];
    id vuale;
    if (isContains) {
        vuale=[self.yyCache objectForKey:key]; //根据key读取数据
    }else{
        vuale = @"缓存不存在";
    }
    return vuale;
}

#pragma -mark 异步方式
-(void)sw_SetAsynData:(id)data withKey:(NSString *)key{
    //根据key写入缓存data
    [self.yyCache setObject:data forKey:key withBlock:^{
        NSLog(@"异步写入缓存成功！！");
    }];
}
-(void)sw_GetAsynDataWithKey:(NSString *)key WithBlock:(YYCacheToolBlock)block{
    self.yyCacheToolBlock = block;
    //判断缓存是否存在
    [self.yyCache containsObjectForKey:key withBlock:^(NSString * _Nonnull key, BOOL contains) {
        NSLog(@"containsObject : %@", contains?@"YES":@"NO");
    }];
    [self.yyCache objectForKey:key withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        if (object == nil) {
            object = @"没有缓存！！";
        }
        self.yyCacheToolBlock(object);
    }];
}

#pragma -mark 清除缓存
-(void)sw_CleanDataWithKey:(NSString *)key{
    if (key.length) {
        //根据key移除缓存
        [self.yyCache removeObjectForKey:key withBlock:^(NSString * _Nonnull key) {
            NSLog(@"removeObjectForKey %@",key);
        }];
    }else{
        //移除所有缓存
        [_yyCache removeAllObjectsWithBlock:^{
            NSLog(@"removeAllObjects sucess");
        }];
    }
}


@end
