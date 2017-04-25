//
//  SqliteManager.m
//  sqlite3-demo
//
//  Created by likai on 2017/4/25.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "SqliteManager.h"

@implementation SqliteManager

+ (instancetype) sharedManager
{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void)openDBWithPath:(NSString *)dbPath
{
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [str stringByAppendingPathComponent:dbPath];
  
    if (sqlite3_open([fileName UTF8String], &_db) == SQLITE_OK) { //打开数据库
        NSLog(@"数据库打开成功");
    } else {
        NSLog(@"打开数据库失败");
    }
    NSLog(@"%@", NSHomeDirectory());
}

- (void)execNoneQuary:(NSString *)sql
{
    char *errMsg = NULL;
    if (sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errMsg) != SQLITE_OK){
        NSLog(@"插入数据失败");
    }else{
        NSLog(@"插入数据成功");
    }
}

- (NSArray *)execQuary:(NSString *)sql
{
    NSMutableArray *mArr = [NSMutableArray array];
    
    sqlite3_stmt *ppStmt;
    if (sqlite3_prepare_v2(_db, [sql UTF8String], -1, &ppStmt, NULL) == SQLITE_OK){
        while (sqlite3_step(ppStmt) == SQLITE_ROW){
            int columnCount = sqlite3_column_count(ppStmt); //取得总列数
            NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
            for (int i = 0; i < columnCount; i ++) {
                const char *name = (char *)sqlite3_column_name(ppStmt, i); //取得列名
                //NSString *nameStr = [NSString stringWithUTF8String:name];
                const unsigned char *value = sqlite3_column_text(ppStmt, i); //取得列名对应的值
                mDic[[NSString stringWithUTF8String:name]] = [NSString stringWithUTF8String:(const char*)value];
            }

//            ShopModel *shopModel = [[ShopModel alloc]init];
//
//            shopModel.name = nameStr;
//            shopModel.price = [NSNumber numberWithFloat:price];
//
//            DetailVC *detailVC = [DetailVC new];
//            detailVC.shopModel = shopModel;
            [mArr addObject:mDic];
        }
    }
    sqlite3_finalize(ppStmt); //释放句柄
    
    return mArr;
}

@end
