//
//  SqliteManager.h
//  sqlite3-demo
//
//  Created by likai on 2017/4/25.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface SqliteManager : NSObject

@property (nonatomic) sqlite3 *db;

//单利
+ (instancetype) sharedManager;

//打开数据库
- (void) openDBWithPath: (NSString *)dbPath;

//执行无返回值的sql
- (void) execNoneQuary: (NSString *)sql;

//执行有返回值的sql
- (NSArray *) execQuary: (NSString *)sql;

@end
