//
//  LKSuccessViewController.m
//  rac_demo
//
//  Created by 李凯 on 2018/12/21.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "LKSuccessViewController.h"
#import "Masonry.h"

@interface LKSuccessViewController ()

@property (nonatomic, strong) UILabel *alertLabel;

@end

@implementation LKSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.alertLabel];
}

- (void)viewDidLayoutSubviews {
    [self.alertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (UILabel *)alertLabel {
    if (!_alertLabel) {
        _alertLabel = [[UILabel alloc]init];
        _alertLabel.text = @"登录成功";
        _alertLabel.font = [UIFont systemFontOfSize:20];
        [_alertLabel sizeToFit];
    }
    return _alertLabel;
}



@end
