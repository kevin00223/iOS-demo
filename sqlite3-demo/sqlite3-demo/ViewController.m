//
//  ViewController.m
//  sqlite3-demo
//
//  Created by likai on 2017/4/21.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "ShopModel.h"
#import "DetailVC.h"



@interface ViewController ()
{
    sqlite3 *db;
}
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;



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
    
    if (sqlite3_open([fileName UTF8String], &db) == SQLITE_OK) { //打开数据库
//        sqlite3_close(db);
//        NSAssert(0, @"数据库打开失败。");
        NSLog(@"数据库打开成功");
        [self setupTable]; //成功打开数据库后 就建表
        //[self quaryDataFromTable]; //建表成功后 读取表
    } else {
        NSLog(@"打开数据库失败");
    }
    NSLog(@"%@", NSHomeDirectory());

    
}

//建表
- (void)setupTable
{
    //创建name/price字段
    const char *sql = "CREATE TABLE IF NOT EXISTS t_shop(id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,price real);";
    char *errMsg = NULL;
    sqlite3_exec(db, sql, NULL, NULL, &errMsg); //数据库, 执行语句, 执行完sql后要执行的函数, 函数的参数, 错误信息
    if (errMsg){
        NSLog(@"table set up failed for %s", errMsg);
    }
    NSLog(@"table set up succeeds");
    
}

//更新表
//- (void)updateTable
//{
//    NSString *sql = [NSString stringWithFormat:@"update t_shop set name = '%@', price = '%@' where id = %@", self.nameField.text, self.priceField.text, self]
//}


//读取表
- (void)quaryDataFromTable
{
    NSString *quary = [NSString stringWithFormat:@"SELECT * FROM t_shop"];
    sqlite3_stmt *ppStmt;
    if (sqlite3_prepare_v2(db, [quary UTF8String], -1, &ppStmt, NULL) == SQLITE_OK){
        while (sqlite3_step(ppStmt) == SQLITE_ROW){
            char *name = (char *)sqlite3_column_text(ppStmt, 1);
            NSString *nameStr = [NSString stringWithUTF8String:name];
            self.nameField.text = nameStr;
            
            float price = sqlite3_column_double(ppStmt, 2);
            self.priceField.text = [NSString stringWithFormat:@"%f", price];
            
//            NSLog(@"name is %@, price is %@", self.nameField.text, self.priceField.text); //可以打印全部表中的数据
            
            ShopModel *shopModel = [[ShopModel alloc]init];
            
            shopModel.name = nameStr;
            shopModel.price = [NSNumber numberWithFloat:price];
            
            DetailVC *detailVC = [DetailVC new];
            detailVC.shopModel = shopModel;
            
            
            NSLog(@"%@", shopModel);
        }
    }
    sqlite3_close(db); //防止内存消耗
//    NSLog(@"name is %@, price is %@", self.nameField.text, self.priceField.text);  只能打印最后一天insert的数据
}


//插入
- (IBAction)insert:(id)sender {
    //1.sql语句
//    NSString *sql = [NSString stringWithFormat:@"INSERT INTO t_shop (name, price) VALUES ('%@, %f')", self.nameField.text, self.priceField.text.doubleValue];
    
    NSString * sql = [NSString stringWithFormat:@"INSERT INTO t_shop(name,price) VALUES('%@',%f)",self.nameField.text,self.priceField.text.doubleValue];
    
    char *errMsg = NULL;
    //2. 执行语句
    sqlite3_exec(db, sql.UTF8String, NULL, NULL, &errMsg);
    if (errMsg){
        NSLog(@"插入数据失败");
    }else{
        NSLog(@"插入数据成功");
    }
    
    [self quaryDataFromTable]; //插入之后 读取表
}

//获取数据条数
- (void)getIDCount
{
    NSString *sql = [NSString stringWithFormat:@"SELECT Count(*) FROM t_shop"];
    char *errMsg = NULL;
    sqlite3_exec(db, sql.UTF8String, NULL, NULL, &errMsg);
    if (errMsg){
        NSLog(@"条数获取失败");
    }else{
        NSLog(@"条数获取成功");
    }
    
}


- (IBAction)delete:(id)sender {
}


- (IBAction)update:(id)sender {
}




@end
