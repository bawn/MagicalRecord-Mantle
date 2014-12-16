//
//  CommonTool.m
//  Money
//
//  Created by beik on 7/24/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import "CommonTool.h"
#import <CommonCrypto/CommonDigest.h>


#define gkey @"8B5705FB1C7C0247A0B0506898526816"
#define kSecrectKeyLength 24


@implementation CommonTool


+ (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}
- (UIViewController *)findViewController:(id)controller{
    if ([controller isMemberOfClass:[UINavigationController class]]) {
        return [self findViewController:[(UINavigationController *)controller visibleViewController]];
    }
    else if ([controller isMemberOfClass:[UITabBarController class]]){
        return [self findViewController:[(UITabBarController *)controller selectedViewController]];
    }
    else if ([controller isKindOfClass:[UIViewController class]]){
        return controller;
    }
    else{
        NSAssert(NO, @"找不到顶端VC");
        return nil;
    }
}


@end
