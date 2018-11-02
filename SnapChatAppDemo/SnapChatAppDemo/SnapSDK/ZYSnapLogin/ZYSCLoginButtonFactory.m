//
//  ZYSCLoginButton.m
//  JollyCommonApp
//
//  Created by Clarence on 2018/8/31.
//

#import "ZYSCLoginButtonFactory.h"

@implementation ZYSCLoginButtonFactory

+ (UIView *)defaultLoginButtonWithDelegate:(id<ZYSCLoginButtonDelegate>)delegate{
    UIView *button = [self creatDefaultLoginButton];
    [button setValue:delegate forKey:@"delegate"];
    return button;
}

+ (UIView *)creatDefaultLoginButton{
    Class SCSDKLoginButtonClass = NSClassFromString(@"SCSDKLoginButton");
    UIView *loginButton = (UIView *)[[SCSDKLoginButtonClass alloc] init];
    return loginButton;
}

@end
