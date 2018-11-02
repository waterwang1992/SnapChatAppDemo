//
//  ZYPerformSeletorHelper.h
//  JollyCommonApp
//
//  Created by Clarence on 2018/8/31.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (AddNilObject)

- (void)zy_addObject:(id _Nullable)object;

@end

@interface ZYNUllObject : NSObject

@end

@interface ZYPerformSeletorHelper : NSObject
+ (id)zy_target:(id)aTarget performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
+ (BOOL)zy_returnBoolWithTarget:(id)aTarget performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end
