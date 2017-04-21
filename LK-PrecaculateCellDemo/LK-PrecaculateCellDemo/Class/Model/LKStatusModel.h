//
//  LKStatusModel.h
//  LK-PrecaculateCellDemo
//
//  Created by yinbake on 2017/4/19.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKUser.h"
#import "LKPic.h"

@interface LKStatusModel : NSObject

@property (nonatomic, strong) NSNumber *atitudes_count;
@property (nonatomic, strong) NSNumber *comments_count;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *idstr;
@property (nonatomic, copy) LKPic *pic_urls;
@property (nonatomic, strong) NSNumber *reposts_count;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) LKUser *user;

//行高
@property (nonatomic, assign) NSInteger rowHeight;

@end
