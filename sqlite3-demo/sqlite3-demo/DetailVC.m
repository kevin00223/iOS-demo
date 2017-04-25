//
//  DetailVC.m
//  sqlite3-demo
//
//  Created by likai on 2017/4/24.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "DetailVC.h"
#import "SqliteManager.h"
#import "ViewController.h"
#import "ShopModel.h"
#import "DetailCell.h"

static NSString *cellID = @"cellID";

@interface DetailVC ()

@property (strong, nonatomic) SqliteManager *sqlManager;
@property (nonatomic, strong) ShopModel *shopModel;

@property (copy, nonatomic) NSArray *shopArr;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor orangeColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    SqliteManager *sqlManager = [SqliteManager sharedManager];
    self.sqlManager = sqlManager;
    
    [self quaryDataFromTable];
}

//读取表
- (void)quaryDataFromTable
{
    NSString *quary = [NSString stringWithFormat:@"SELECT * FROM t_shop"];
    NSArray *arr = [self.sqlManager execQuary:quary]; //字典数组
    
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        ShopModel *spModel = [ShopModel modelWithDic:dic];
        [mArr addObject:spModel];
    }
    self.shopArr = mArr;
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.shopArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.shopModel = self.shopArr[indexPath.row];
    cell.IDField.text = [NSString stringWithFormat:@"%ld", (long)cell.shopModel.idNum];
    cell.nameField.text = cell.shopModel.name;
    cell.priceField.text = [NSString stringWithFormat:@"%@", cell.shopModel.price];
    
//    [cell layoutSubviews];
    
    return cell;
}

//初始化
- (NSArray *) arr
{
    if (!_shopArr)
    {
        _shopArr = [NSArray new];
    }
    return _shopArr;
}

@end
