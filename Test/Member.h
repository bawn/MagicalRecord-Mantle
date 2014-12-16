//
//  Member.h
//  ShellMoney
//
//  Created by beik on 11/3/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface Member : MTLModel<MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic, retain) NSString * memberID;
@property (nonatomic, retain) NSString * mobilePhone;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSNumber *goldNumber;

@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) BOOL isVip;
@property (nonatomic, retain) NSURL *url;


@end
