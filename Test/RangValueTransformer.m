//
//  RangValueTransformer.m
//  Test
//
//  Created by beike on 6/26/15.
//  Copyright (c) 2015 beike. All rights reserved.
//

#import "RangValueTransformer.h"

@implementation RangValueTransformer

//是否需要反向转换
+ (BOOL)allowsReverseTransformation {
    return YES;
}
//如果是储存到数据库，最总转换的类型当然是NSData
+ (Class)transformedValueClass {
    return [NSData class];
}
//NSRang-->NSData
- (id)transformedValue:(NSValue *)value {
    return [self dataWithValue:value];
}
//NSData-->NSRang
- (id)reverseTransformedValue:(id)value {
    return [self valueWithData:value];
}



- (NSData *)dataWithValue:(NSValue *)value {
    return [NSKeyedArchiver archivedDataWithRootObject:value];
}

- (NSValue *)valueWithData:(NSData *)data {
    return (NSValue *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
