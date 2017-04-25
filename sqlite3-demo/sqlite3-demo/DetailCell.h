//
//  DetailCell.h
//  sqlite3-demo
//
//  Created by likai on 2017/4/25.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

@interface DetailCell : UITableViewCell

@property (strong, nonatomic) ShopModel *shopModel;

@property (weak, nonatomic) IBOutlet UITextField *IDField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;

@end
