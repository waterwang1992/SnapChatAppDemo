//
//  ZYDLOpenSnap.h
//  JollyChic
//
//  Created by Clarence on 2018/8/15.
//  Copyright © 2018年 Lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYDLOpenSnap : NSObject

@property (assign, nonatomic, readonly) BOOL isSuccessLoad;

+ (instancetype)shareSnap;

- (BOOL)startLoad;

@end
