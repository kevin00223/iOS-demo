//
//  LKSimulatedNetworkService.m
//  rac_demo
//
//  Created by 李凯 on 2018/12/21.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "LKSimulatedNetworkService.h"

@implementation LKSimulatedNetworkService

- (void)signInWithUserName:(NSString *)userName password:(NSString *)password complete:(signInResponse)completeBlock {
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        BOOL success = [userName isEqualToString:@"111"] && [password isEqualToString:@"111111"];
        completeBlock(success);
    });
}

@end
