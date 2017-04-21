//
//  LKHomeCell.h
//  LK-PrecaculateCellDemo
//
//  Created by yinbake on 2017/4/19.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKStatusModel.h"

@interface LKHomeCell : UITableViewCell

@property (nonatomic, strong) LKStatusModel *model;

- (NSInteger)getMaxY;

@end
