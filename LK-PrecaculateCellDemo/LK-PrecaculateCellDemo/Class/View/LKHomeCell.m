//
//  LKHomeCell.m
//  LK-PrecaculateCellDemo
//
//  Created by yinbake on 2017/4/19.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "LKHomeCell.h"
#import "Masonry.h"

static CGFloat margin = 15;

@interface LKHomeCell ()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *sourceLabel;
@property (nonatomic, weak) UILabel *createdLabel;
@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation LKHomeCell

- (NSInteger)getMaxY
{
    [self layoutIfNeeded]; //cell有值了 需要先更新一下布局
    //return self.contentView.bounds.size.height+margin;
    return CGRectGetMaxY(self.contentLabel.frame)+margin;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    //头像
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:@"iconView"];
    iconView.layer.cornerRadius = 22.5;
    iconView.layer.masksToBounds = YES;
    self.iconView = iconView;
    [self.contentView addSubview:iconView];
    //self.iconView = iconView;
    
    //昵称
    UILabel *nameLabel = [UILabel new];
    nameLabel.numberOfLines = 1;
    nameLabel.text = @"xx";
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    //self.nameLabel = nameLabel;
    
    //来源
    UILabel *sourceLabel = [UILabel new];
    sourceLabel.numberOfLines = 1;
    sourceLabel.text = @"$$$";
    self.sourceLabel = sourceLabel;
    [self.contentView addSubview:sourceLabel];
    //self.sourceLabel = sourceLabel;
    
    //时间
    UILabel *createdLabel = [UILabel new];
    createdLabel.numberOfLines = 1;
    createdLabel.text = @"12:00";
    self.createdLabel = createdLabel;
    [self.contentView addSubview:createdLabel];
    //self.createdLabel = createdLabel;
    
    //内容
    UILabel *contentLabel = [UILabel new];
    contentLabel.numberOfLines = 0;
    contentLabel.text = @"RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR";
    self.contentLabel = contentLabel;
    [self.contentView addSubview:contentLabel];
    //self.contentLabel = contentLabel;
    
    //自动布局
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(margin);
        make.width.height.offset(45);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconView);
        make.left.equalTo(iconView.mas_right).offset(margin);
    }];
    
    [sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
//        make.top.equalTo(nameLabel.mas_bottom).offset(margin);
        make.bottom.equalTo(iconView);
    }];
    
    [createdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(sourceLabel);
        make.bottom.equalTo(sourceLabel);
        make.right.offset(-margin);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView);
        make.right.equalTo(createdLabel);
        make.top.equalTo(sourceLabel.mas_bottom).offset(margin);
        //make.bottom.offset(-margin);
    }];
    
    
}

- (void)setModel:(LKStatusModel *)model
{
    _model = model;
    self.nameLabel.text = model.user.name;
    self.sourceLabel.text = model.source;
    self.createdLabel.text = model.created_at;
    self.contentLabel.text = model.text;
}

@end
