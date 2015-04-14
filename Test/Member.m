//
//  Member.m
//  ShellMoney
//
//  Created by beik on 11/3/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import "Member.h"

@implementation Member


+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"memberID" : @"id",
             @"mobilePhone" : @"phone",
             @"createDate" : @"date",
             @"goldNumber" : @"goldNumber",
             @"age" : @"age",
             @"isVip" : @"isVip",
             @"url" : @"url"
             };
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return dateFormatter;
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"createDate"]) {
        return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *string, BOOL *success, NSError *__autoreleasing *error) {
            return [self.dateFormatter dateFromString:string];
        } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
             return [self.dateFormatter stringFromDate:date];
        }];
    }
    else{
        return nil;
    }
}

+ (NSValueTransformer *)ageJSONTransformer{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *string, BOOL *success, NSError *__autoreleasing *error) {
        return @([string integerValue]);
    } reverseBlock:^id(NSNumber *number, BOOL *success, NSError *__autoreleasing *error) {
        return [number stringValue];
    }];
}


+ (NSValueTransformer *)urlJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)isVipJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

- (void)setNilValueForKey:(NSString *)key{
    if ([key isEqualToString:@"isVip"]) {
        self.isVip = 0;
    }
    else{
        [super setNilValueForKey:key];
    }
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName{
    return @"MemberManaged";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey{
    return @{
             @"memberID" : @"memberID",
             @"mobilePhone" : @"mobilePhone",
             @"createDate" : @"createDate",
             @"goldNumber" : @"goldNumber",
             @"age" : @"age",
             @"isVip" : @"isVip",
             @"url" : @"url"
             };
}


+ (NSSet *)propertyKeysForManagedObjectUniquing{
    return [NSSet setWithObject:@"memberID"];
}


//+ (NSValueTransformer *)entityAttributeTransformerForKey:(NSString *)key{
//    if ([key isEqualToString:@"url"]) {
//        return [MTLValueTransformer transformerUsingForwardBlock:^id(NSURL *url, BOOL *success, NSError *__autoreleasing *error) {
//            return url.absoluteString;
//        }];
//    }
//    else{
//        return nil;
//    }
//}

//+ (NSValueTransformer *)urlEntityAttributeTransformer{
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSURL *url, BOOL *success, NSError *__autoreleasing *error) {
//        return url.absoluteString;
//    }];
//}

@end
