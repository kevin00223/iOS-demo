//
//  LKUser.h
//  LK-PrecaculateCellDemo
//
//  Created by yinbake on 2017/4/19.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKUser : NSObject

@property (nonatomic, strong) NSNumber *mbrank;
@property (nonatomic, strong) NSNumber *bmtype;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *profile_image_url;
@property (nonatomic, assign) Boolean vip;

@end
