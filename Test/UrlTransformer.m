//
//  UrlTransformer.m
//  Test
//
//  Created by beik on 12/15/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import "UrlTransformer.h"

@implementation UrlTransformer

+ (BOOL)allowsReverseTransformation {
    return YES;
}

+ (Class)transformedValueClass {
    return [NSData class];
} 

- (id)transformedValue:(id)value {
    return [NSData dataWithData:[[(NSURL *)value absoluteString] dataUsingEncoding:NSUTF8StringEncoding]];
}

- (id)reverseTransformedValue:(id)value {
    return [NSURL URLWithString:[[NSString alloc] initWithData:value encoding:NSUTF8StringEncoding]];
}

@end
