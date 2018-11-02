//
//  ViewController.m
//  SnapChatAppDemo
//
//  Created by Clarence on 2018/8/16.
//  Copyright © 2018年 Clarence. All rights reserved.
//

#import "ViewController.h"
#import "ZYSCLoginKit.h"

@interface ViewController () <ZYSCLoginButtonDelegate>
@property (strong, nonatomic) ZYDLOpenSnap *snap;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *muAry = @[].mutableCopy;
    [muAry zy_addObject:@"param1"];
    [muAry zy_addObject:@1];
    [muAry zy_addObject:nil];
    [muAry zy_addObject:@"param4"];
    
   BOOL startLoad =  [[ZYDLOpenSnap shareSnap] startLoad];
    if (startLoad) {
        UIView *loginButton =  [ZYSCLoginButtonFactory defaultLoginButtonWithDelegate:self];
        [loginButton setFrame:CGRectMake(100, 200, 300, 45)];
        [self.view addSubview:loginButton];
    }
}

- (void)loginButtonDidTap{
    
}

+ (void)testWithParam1:(NSString *)param1 param2:(NSInteger *)param2 param3:(NSString *)param3 param4:(NSString *)param4{
    NSLog(@"+++++++++\nparam1 = %@, param2 = %@, param3 = %@, param4 = %@", param1, param2, param3, param4);
}

- (void)testWithParam1:(NSString *)param1 param2:(NSInteger *)param2 param3:(NSString *)param3 param4:(NSString *)param4{
    NSLog(@"---------\nparam1 = %@, param2 = %@, param3 = %@, param4 = %@", param1, param2, param3, param4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
