//
//  LKHomeViewController.m
//  LK-PrecaculateCellDemo
//
//  Created by yinbake on 2017/4/19.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "LKHomeViewController.h"
#import "YYModel.h"
#import "LKStatusModel.h"
#import "LKHomeCell.h"

static NSString *cellID = @"cellID";

@interface LKHomeViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray <LKStatusModel *> *_arr;
}

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation LKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setupUI];
    [self loadData];
    
    
}

//加载数据
- (void)loadData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *arr = dic[@"statuses"];
    _arr = [NSArray yy_modelArrayWithClass:[LKStatusModel class] json:arr];
    //NSLog(@"%@", _arr);
    
    //设置行高
    LKHomeCell *cell = [[LKHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    for (LKStatusModel *model in _arr) {
        
        cell.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1000);//!!!!!!!
        cell.model = model;//!!!!!!!  把model赋值给cell
        model.rowHeight = [cell getMaxY];
    }
    
    [self.tableView reloadData];//!!!!!!!!
    NSLog(@"%s", __func__);
}

- (void)setupUI
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    tableView.backgroundColor = [UIColor greenColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[LKHomeCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    
    //自适应行高
//    tableView.estimatedRowHeight = 100;
//    tableView.rowHeight = UITableViewAutomaticDimension;
    NSLog(@"%s", __func__);
    
}

#pragma mark -- tableViewDelegate+tableViewDataSource#

//取行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __func__);
    return _arr[indexPath.row].rowHeight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%s", __func__);
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __func__);
    
    LKHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.model = _arr[indexPath.row];
    return cell;
}






@end
