//
//  MemberManaged.h
//  Test
//
//  Created by beik on 12/15/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MemberManaged : NSManagedObject

@property (nonatomic, retain) NSString * memberID;
@property (nonatomic, retain) NSString * mobilePhone;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSNumber * goldNumber;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * isVip;
@property (nonatomic, retain) NSString * url;

@end
