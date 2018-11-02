//
//  ZYSCLoginClient.m
//  JollyCommonApp
//
//  Created by Clarence on 2018/8/31.
//

#import "ZYSCLoginClient.h"
#import <UIKit/UIKit.h>
#import "ZYPerformSeletorHelper.h"

@interface ZYSCLoginClient ()

@end

@implementation ZYSCLoginClient

+ (BOOL)isUserLoggedIn{
    return [ZYPerformSeletorHelper zy_returnBoolWithTarget:self.loginClientClass performSelector:@selector(isUserLoggedIn) withObjects:nil];
}

+ (void)loginFromViewController:(UIViewController *)viewController completion:(ZYSnapLoginCompletion)completion{
    [self.loginClientClass  performSelector:@selector(loginFromViewController:completion:) withObject:viewController withObject:completion];
}

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSMutableArray *paramAry = [@[] mutableCopy];
    [paramAry zy_addObject:application];
    [paramAry zy_addObject:url];
    [paramAry zy_addObject:options];
    return [ZYPerformSeletorHelper zy_returnBoolWithTarget:self.loginClientClass performSelector:@selector(application:openURL:options:) withObjects:paramAry];
}

+ (void)unlinkCurrentSessionWithCompletion:(void (^)(BOOL))completion{
    [self.loginClientClass performSelector:@selector(unlinkCurrentSessionWithCompletion:) withObject:completion];
}

+ (void)unlinkAllSessionsWithCompletion:(void (^)(BOOL))completion{
    [self.loginClientClass performSelector:@selector(unlinkAllSessionsWithCompletion:) withObject:completion];
}

+ (void)fetchUserDataWithQuery:(NSString *)query variables:(NSDictionary<NSString *,id> *)variables success:(ZYSCOAuth2GetResourcesSuccessCompletionBlock)success failure:(ZYSCOAuth2GetResourcesFailureCompletionBlock)failure{
    NSMutableArray *paramAry = [@[] mutableCopy];
    [paramAry zy_addObject:query];
    [paramAry zy_addObject:variables];
    [paramAry zy_addObject:success];
    [paramAry zy_addObject:failure];
    [ZYPerformSeletorHelper zy_target:self.loginClientClass performSelector:@selector(fetchUserDataWithQuery:variables:success:failure:) withObjects:paramAry];
}

+ (Class)loginClientClass{
    return NSClassFromString(@"SCSDKLoginClient");
}

@end
