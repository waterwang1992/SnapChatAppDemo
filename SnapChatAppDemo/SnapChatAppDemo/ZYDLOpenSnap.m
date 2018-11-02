//
//  ZYDLOpenSnap.m
//  JollyChic
//
//  Created by Clarence on 2018/8/15.
//  Copyright © 2018年 Lc. All rights reserved.
//

#import "ZYDLOpenSnap.h"
#include <dlfcn.h>


typedef void(^SnapBlock)(BOOL success, NSError * _Nullable error);

@interface ZYDLOpenSnap ()
@property (weak, nonatomic) UIViewController *viewController;
@end

@implementation ZYDLOpenSnap

- (instancetype)initWithViewController:(id)viewcontroller
{
    self = [super init];
    if (self) {
        [self loadFramework:@"SCSDKCoreKit.framework"];
        [self loadFramework:@"SCSDKLoginKit.framework"];
        _viewController = viewcontroller;
        [self setup];
    }
    return self;
}

// 加载动态库
- (BOOL)loadFramework:(NSString *)frameworkName {
    NSString *path = [NSString stringWithFormat:@"%@/%@", [NSBundle mainBundle].bundlePath, frameworkName];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    if (!bundle) {
        NSLog(@"%@ not found", frameworkName);
        return NO;
    }
    
    NSError *error;
    if (![bundle loadAndReturnError:&error]) {
        NSLog(@"Load %@ failed: %@", frameworkName, error);
        return NO;
    } else {
        NSLog(@"Load %@ success", frameworkName);
    }
    
    return YES;
}

- (void)setup{
    Class SCSDKLoginButtonClass = NSClassFromString(@"SCSDKLoginButton");
    UIView *loginButton = (UIView *)[[SCSDKLoginButtonClass alloc] init];
    [loginButton setFrame:CGRectMake(100, 200, 300, 45)];
    [loginButton setValue:self forKey:@"delegate"];
    [_viewController.view addSubview:loginButton];
}

- (void)loginButtonDidTap{
//     Class SCSDKLoginButtonClass = NSClassFromString(@"SCSDKLoginClient");
//    SnapBlock block = ^(BOOL success, NSError * _Nullable error){
//                                               if (error) {
//                                                   NSLog(@"error:%@", error);
//                                               }else{
//                                                   NSLog(@"登陆成功");
//                                               }
//    };
//    
//    [SCSDKLoginButtonClass performSelector:@selector(loginFromViewController:completion:) withObject:_viewController withObject:block];
}
@end
