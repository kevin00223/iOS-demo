//
//  DetailCell.m
//  sqlite3-demo
//
//  Created by likai on 2017/4/24.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "DetailCell.h"

@interface DetailCell ()



@end

@implementation DetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self){
        [self setupUI];
    }
    return self;
}

- (void)setShopModel:(ShopModel *)shopModel
{
    _shopModel = shopModel;
    
}

- (void)setupUI
{
    
}

@end
