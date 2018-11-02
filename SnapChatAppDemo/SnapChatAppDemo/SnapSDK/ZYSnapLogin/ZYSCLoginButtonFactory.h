//
//  ZYSCLoginButton.h
//  JollyCommonApp
//
//  Created by Clarence on 2018/8/31.
//

#import <UIKit/UIKit.h>

@protocol ZYSCLoginButtonDelegate
- (void)loginButtonDidTap;
@end

@interface ZYSCLoginButtonFactory : NSObject

+ (UIView *)defaultLoginButtonWithDelegate:(id<ZYSCLoginButtonDelegate>)delegate;

@end
