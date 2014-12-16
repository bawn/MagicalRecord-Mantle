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
    return @{@"memberID" : @"id",
             @"mobilePhone" : @"phone",
             @"createDate" : @"date"
             };
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return dateFormatter;
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"createDate"]) {
        return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *string) {
            return [self.dateFormatter dateFromString:string];
        } reverseBlock:^id(NSDate *date) {
             return [self.dateFormatter stringFromDate:date];
        }];
    }
    else{
        return nil;
    }
}

+ (NSValueTransformer *)ageJSONTransformer{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *string) {
        return @([string integerValue]);
    } reverseBlock:^id(NSNumber *number) {
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
    return nil;
}


+ (NSSet *)propertyKeysForManagedObjectUniquing{
    return [NSSet setWithObject:@"memberID"];
}


+ (NSValueTransformer *)entityAttributeTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"url"]) {
        return [MTLValueTransformer reversibleTransformerWithBlock:^id(NSURL *url) {
            return url.absoluteString;
        }];
    }
    else{
        return nil;
    }
}

//+ (NSValueTransformer *)urlEntityAttributeTransformer{
//    return [MTLValueTransformer reversibleTransformerWithBlock:^id(NSURL *url) {
//        return url.absoluteString;
//    }];
//}

@end
