//
//  LKSimulatedNetworkService.h
//  rac_demo
//
//  Created by 李凯 on 2018/12/21.
//  Copyright © 2018年 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^signInResponse)(BOOL);

@interface LKSimulatedNetworkService : NSObject

- (void)signInWithUserName: (NSString *)userName password: (NSString *)password complete: (signInResponse)completeBlock;

@end

NS_ASSUME_NONNULL_END
