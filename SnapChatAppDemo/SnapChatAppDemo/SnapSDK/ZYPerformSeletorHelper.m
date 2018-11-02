//
//  ZYPerformSeletorHelper.m
//  JollyCommonApp
//
//  Created by Clarence on 2018/8/31.
//

#import "ZYPerformSeletorHelper.h"

@implementation NSMutableArray (AddNilObject)
- (void)zy_addObject:(id)object{
    if (object == nil) {
        [self addObject:[ZYNUllObject new]];
    }else{
        [self addObject:object];
    }
}

@end

@implementation ZYNUllObject

@end

@implementation ZYPerformSeletorHelper

+ (id)zy_target:(id)aTarget performSelector:(SEL)aSelector withObjects:(NSArray *)objects{
    NSMethodSignature *methodSignature = [aTarget methodSignatureForSelector:aSelector];
    if(methodSignature == nil)
    {
        @throw [NSException exceptionWithName:@"抛异常错误" reason:@"没有这个方法，或者方法名字错误" userInfo:nil];
        return nil;
    }
    else
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        [invocation setTarget:aTarget];
        [invocation setSelector:aSelector];
        //签名中方法参数的个数，内部包含了self和_cmd，所以参数从第3个开始
        NSInteger  signatureParamCount = methodSignature.numberOfArguments - 2;
        NSInteger requireParamCount = objects.count;
        NSInteger resultParamCount = MIN(signatureParamCount, requireParamCount);
        for (NSInteger i = 0; i < resultParamCount; i++) {
            id  obj = objects[i];
            if ([obj isKindOfClass:[ZYNUllObject class]]) {
                id tempNilObject = nil;
                [invocation setArgument:&tempNilObject atIndex:i + 2];
            }else{
                [invocation setArgument:&obj atIndex:i+2];
            }
        }
        [invocation invoke];
        //返回值处理
        id callBackObject = nil;
        if(methodSignature.methodReturnLength)
        {
            [invocation getReturnValue:&callBackObject];
        }
        return callBackObject;
    }
}

+ (BOOL)zy_returnBoolWithTarget:(id)aTarget performSelector:(SEL)aSelector withObjects:(NSArray *)objects{
    NSMethodSignature *methodSignature = [aTarget methodSignatureForSelector:aSelector];
    if(methodSignature == nil)
    {
        @throw [NSException exceptionWithName:@"抛异常错误" reason:@"没有这个方法，或者方法名字错误" userInfo:nil];
        return NO;
    }
    else
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        [invocation setTarget:aTarget];
        [invocation setSelector:aSelector];
        //签名中方法参数的个数，内部包含了self和_cmd，所以参数从第3个开始
        NSInteger  signatureParamCount = methodSignature.numberOfArguments - 2;
        NSInteger requireParamCount = objects.count;
        NSInteger resultParamCount = MIN(signatureParamCount, requireParamCount);
        for (NSInteger i = 0; i < resultParamCount; i++) {
            id  obj = objects[i];
            if ([obj isKindOfClass:[ZYNUllObject class]]) {
                id tempNilObject = nil;
                [invocation setArgument:&tempNilObject atIndex:i + 2];
            }else{
                [invocation setArgument:&obj atIndex:i+2];
            }
        }
        [invocation invoke];
        //返回值处理
        BOOL result = NO;
        if(methodSignature.methodReturnLength)
        {
            [invocation getReturnValue:&result];
        }
        return result;
    }
}

@end
