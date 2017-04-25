//
//  ShopModel.h
//  sqlite3-demo
//
//  Created by likai on 2017/4/24.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopModel : NSObject

@property (nonatomic, assign) NSInteger idNum;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *price;

+ (instancetype) modelWithDic: (NSDictionary *)dic;


@end
