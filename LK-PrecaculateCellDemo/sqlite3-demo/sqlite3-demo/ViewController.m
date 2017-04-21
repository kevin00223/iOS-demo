//
//  ViewController.m
//  sqlite3-demo
//
//  Created by likai on 2017/4/21.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()
{
    sqlite3 *db;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [str stringByAppendingPathComponent:@"db.sqlite"];
    
    //NSFileManager *fileManager = [[NSFileManager alloc]init];
    //[fileManager createDirectoryAtPath:fileName withIntermediateDirectories:YES attributes:nil error:nil];
    
    //NSLog(@"%@", NSHomeDirectory());
    
    if (sqlite3_open([fileName UTF8String], &db) == SQLITE_OK) {
//        sqlite3_close(db);
//        NSAssert(0, @"数据库打开失败。");
        NSLog(@"数据库打开成功");
    }
    NSLog(@"%@", NSHomeDirectory());
//    if ([fileManager fileExistsAtPath:fileName]==NO){
//        if (sqlite3_open(fileName.UTF8String, &db)==SQLITE_OK)
//        {
//            char *errmsg;
//            const char *createSql = "CREATE TABLE IF NOT EXISTS student (id integer PRIMARY KEY AUTOINCREMENT,NUM TEXT,CLASSNAME TEXT,NAME TEXT)";
//            if (sqlite3_exec(db, createSql, NULL, NULL, &errmsg)!= SQLITE_OK)
//            {
//                NSLog(@"创建数据库表失败");
//            }
//        }
//    }else{
//        NSLog(@"%@", NSHomeDirectory());
//        NSLog(@"fileName文件存在");
//    }
    
    [self setupTable];
    
}

//建表
- (void)setupTable
{
    const char *sql = "CREATE TABLE IF NOT EXISTS t_shop(id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,price real);";
    char *errMsg = NULL;
    sqlite3_exec(db, sql, NULL, NULL, &errMsg);
    if (errMsg){
        NSLog(@"table set up failed for %s", errMsg);
    }
    NSLog(@"table set up succeeds");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
