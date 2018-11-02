//
//  ZYSCLoginClient.h
//  JollyCommonApp
//
//  Created by Clarence on 2018/8/31.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 登陆回调

 @param success 是否登录成功
 @param error 错误信息
 */
typedef void(^ZYSnapLoginCompletion)(BOOL success, NSError * _Nullable error);

/**
 * Callback to trigger when fetch resource success.
 *
 * @param resources that contain user data.
 */
typedef void(^ZYSCOAuth2GetResourcesSuccessCompletionBlock)(NSDictionary * _Nullable resources);

/**
 * Callback to trigger when fetch resource failed.
 *
 * @param error that happened when fetch data from resource server.
 * @param isUserLoggedOut set to YES if the connection between 3PA and Snapchat is broken or user is not logged in to 3PA using Snapchat. Set to NO if other errors occur while fetching data from Snapchat
 */
typedef void(^ZYSCOAuth2GetResourcesFailureCompletionBlock)(NSError * _Nullable error, BOOL isUserLoggedOut);

static NSString * _Nonnull const kZYSCSDKLoginClientUserUnlinkNotification = @"kSCSDKLoginClientUserUnlinkNotification";
static NSString * _Nonnull const kZYSCSDKLoginClientUserLinkNotification = @"kSCSDKLoginClientUserLinkNotification";
static NSString * _Nonnull const kZYSCSDKLoginClientUserLinkFailedNotification = @"kSCSDKLoginClientUserLinkFailedNotification";

@interface ZYSCLoginClient : NSObject

@property (class, assign, readonly) BOOL isUserLoggedIn;

/**
 * Start Auth with Snapchat.
 *
 * @param viewController that shows the in-app auth page.
 */
+ (void)loginFromViewController:(UIViewController *_Nonnull)viewController
                     completion:(ZYSnapLoginCompletion)completion;

/**
 * Finish auth with Snapchat.
 *
 * @param application for singleton app object of calling app
 * @param url created by Snapchat.
 * @param options for the url to handle
 * @return YES if Snapchat can open the the url, NO if it cannot
 */
+ (BOOL)application:(UIApplication *_Nonnull)application
            openURL:(NSURL *_Nonnull)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *_Nullable)options;

/**
 * Revoke current session.
 *
 * @param completion block be trigged when finish revoking session.
 */
+ (void)unlinkCurrentSessionWithCompletion:(nullable void (^)(BOOL success))completion;

/**
 * Revoke all sessions.
 *
 * @param completion block be trigged when finish revoking session.
 */
+ (void)unlinkAllSessionsWithCompletion:(nonnull void (^)(BOOL success))completion;

/**
 * Interface to fetch user data from resource server.
 *
 * @param query GraphQL query to fetch user data.
 * @param success Success block when fetch data succeed.
 * @param failure Failure block when fetch data failed.
 */
+ (void)fetchUserDataWithQuery:(nonnull NSString *)query
                     variables:(nullable NSDictionary<NSString *, id> *)variables
                       success:(nonnull ZYSCOAuth2GetResourcesSuccessCompletionBlock)success
                       failure:(nonnull ZYSCOAuth2GetResourcesFailureCompletionBlock)failure;

@end
