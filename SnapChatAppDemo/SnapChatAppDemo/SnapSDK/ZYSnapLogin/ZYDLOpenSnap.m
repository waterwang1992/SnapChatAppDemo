//
//  ZYDLOpenSnap.m
//  JollyChic
//
//  Created by Clarence on 2018/8/15.
//  Copyright © 2018年 Lc. All rights reserved.
//

#if DEBUG == 1

#define TRACE_LOG(...) NSLog(__VA_ARGS__)
#define EVENT_LOG(...) NSLog(__VA_ARGS__)
#define ERROR_LOG(...) NSLog(__VA_ARGS__)
#define RESPONSE_LOG(...) NSLog(__VA_ARGS__)
#define NETWORK_LOG(...) NSLog(__VA_ARGS__)

#else

#define TRACE_LOG(...)
#define EVENT_LOG(...)
#define ERROR_LOG(...)
#define RESPONSE_LOG(...)
#define NETWORK_LOG(...)
#define ERROR_LOG(...)

#endif

//是否iOS10以上
#define iOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ? YES : NO)

#import "ZYDLOpenSnap.h"
#include <dlfcn.h>

typedef void(^SnapBlock)(BOOL success, NSError * _Nullable error);

@interface ZYDLOpenSnap ()
@property (assign, nonatomic) BOOL isSuccessLoad;
@end

@implementation ZYDLOpenSnap

+ (instancetype)shareSnap {
    static ZYDLOpenSnap *snap = nil;
    static dispatch_once_t dispacth;
    dispatch_once(&dispacth, ^{
        snap = [[ZYDLOpenSnap alloc]init];
    });
    return snap;
}

- (BOOL)startLoad{
    _isSuccessLoad = [self loadFramework];
    return _isSuccessLoad;
}

- (BOOL)loadFramework{
    //如果ios10一下不加载
    if (!iOS10) {
        return NO;
    }
    //如果已经加载过, 则不必再加载
    if (_isSuccessLoad) return YES;
    BOOL loadLoginKit =  [self loadFramework:@"SCSDKLoginKit.framework"];
    if ( loadLoginKit == YES) return YES;
    return NO;
}

// 加载动态库
- (BOOL)loadFramework:(NSString *)frameworkName {
    NSString *path = [NSString stringWithFormat:@"%@/Frameworks/%@", [NSBundle mainBundle].bundlePath, frameworkName];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    if (!bundle) {
        ERROR_LOG(@"%@ not found", frameworkName);
        return NO;
    }
    
    NSError *error;
    if (![bundle loadAndReturnError:&error]) {
        ERROR_LOG(@"Load %@ failed: %@", frameworkName, error);
        return NO;
    } else {
        EVENT_LOG(@"Load %@ success", frameworkName);
    }
    
    return YES;
}

@end
