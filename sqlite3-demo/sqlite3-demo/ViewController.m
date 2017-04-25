//
//  ViewController.m
//  sqlite3-demo
//
//  Created by likai on 2017/4/21.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "ViewController.h"
#import "ShopModel.h"
#import "DetailVC.h"
#import "SqliteManager.h"

@interface ViewController ()

@property (strong, nonatomic) SqliteManager *sqlManager;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SqliteManager *sqlManager = [SqliteManager sharedManager];
    [sqlManager openDBWithPath:@"db.sqlite"]; //创建数据库并打开
    
    //全局
    self.sqlManager = sqlManager;
    
    [self setupTable];
    
}

//建表
- (void)setupTable
{
    const char *sql = "CREATE TABLE IF NOT EXISTS t_shop(id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,price real);";
    [self.sqlManager execQuary:[NSString stringWithUTF8String:sql]];
}

//插入
- (IBAction)insert:(id)sender {
    
    NSString * sql = [NSString stringWithFormat:@"INSERT INTO t_shop(name,price) VALUES('%@',%f)",self.nameField.text,self.priceField.text.doubleValue];
    [self.sqlManager execNoneQuary:sql];
}


- (IBAction)delete:(id)sender {
}


- (IBAction)update:(id)sender {
}




@end
