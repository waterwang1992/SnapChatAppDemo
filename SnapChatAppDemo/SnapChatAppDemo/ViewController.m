//
//  ViewController.m
//  SnapChatAppDemo
//
//  Created by Clarence on 2018/8/16.
//  Copyright © 2018年 Clarence. All rights reserved.
//

#import "ViewController.h"
#import "ZYDLOpenSnap.h"
#import "ZYPerformSeletorHelper.h"

@interface ViewController ()
@property (strong, nonatomic) ZYDLOpenSnap *snap;
@end

@implementation ViewController

+ (BOOL)testBool{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *muAry = @[].mutableCopy;
    [muAry zy_addObject:@"param1"];
    [muAry zy_addObject:@1];
    [muAry zy_addObject:nil];
    [muAry zy_addObject:@"param4"];
    //[ZYPerformSeletorHelper zy_class:[self class] performSelector:@selector(testWithParam1:param2:param3:param4:) withObjects:muAry];
    
    //[ZYPerformSeletorHelper zy_target:[self class] performSelector:@selector(testWithParam1:param2:param3:param4:) withObjects:muAry];
  BOOL result =  [ZYPerformSeletorHelper zy_returnBoolWithTarget:self.class performSelector:@selector(testBool) withObjects:nil];
    NSLog(@"---%d", result);
    
 //  _snap = [[ZYDLOpenSnap alloc] initWithViewController:self];
//    SCSDKLoginButton *loginButton =  [[SCSDKLoginButton alloc] init];
//    [loginButton setFrame:CGRectMake(100, 200, 300, 45)];
//    [self.view addSubview:loginButton];
    // Do any additional setup after loading the view, typically from a nib.
}


+ (void)testWithParam1:(NSString *)param1 param2:(NSInteger *)param2 param3:(NSString *)param3 param4:(NSString *)param4{
    NSLog(@"+++++++++\nparam1 = %@, param2 = %@, param3 = %@, param4 = %@", param1, param2, param3, param4);
}

- (void)testWithParam1:(NSString *)param1 param2:(NSInteger *)param2 param3:(NSString *)param3 param4:(NSString *)param4{
    NSLog(@"---------\nparam1 = %@, param2 = %@, param3 = %@, param4 = %@", param1, param2, param3, param4);
}
- (void)loginButtonDidTap{
//    [SCSDKLoginClient loginFromViewController:self
//                                   completion:^(BOOL success, NSError * _Nullable error) {
//                                       if (error) {
//                                           NSLog(@"error:%@", error);
//                                       }else{
//                                           NSLog(@"登陆成功");
//                                       }
//                                   }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
