//
//  ShopModel.m
//  sqlite3-demo
//
//  Created by likai on 2017/4/24.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

+ (instancetype)modelWithDic:(NSDictionary *)dic
{
    ShopModel *shopModel = [[self alloc]init];
    [shopModel setValuesForKeysWithDictionary:dic];
    return shopModel;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]){
        self.idNum = [value integerValue];
    }
}

@end
