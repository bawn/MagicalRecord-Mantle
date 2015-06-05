//
//  ViewController.m
//  Test
//
//  Created by beik on 8/7/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <Mantle.h>
#import "Member.h"
#import "MemberManaged.h"
#import "MagicalRecord.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSDictionary *dic = @{
                          @"id" : @"2",
                          @"phone" : @"xxxxxxxx",
                          @"date" : @"2014-09-09",
                          @"goldNumber" : @2,
                          @"age" : @"18",
                          @"url" : @"http://bawn.github.io/",
                          @"isVip" : NSNull.null
                          };
    
    Member *member = [MTLJSONAdapter modelOfClass:[Member class] fromJSONDictionary:dic error:nil];
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        [MTLManagedObjectAdapter managedObjectFromModel:member insertingIntoContext:localContext error:nil];
    } completion:^(BOOL success, NSError *error) {
        NSLog(@"%lu", (unsigned long)[MemberManaged MR_findAll].count);
    }];

    
    
    
    
}

- (IBAction)updateData:(id)sender{
    NSDictionary *dic = @{
                          @"id" : @"2",
                          @"phone" : @"xxxxxxxx",
                          @"date" : @"2015-12-09",
                          @"goldNumber" : @2,
                          @"age" : @"19",
                          @"url" : @"http://bawn.github.io/",
                          @"isVip" : NSNull.null
                          };
    Member *member = [MTLJSONAdapter modelOfClass:[Member class] fromJSONDictionary:dic error:nil];
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        [MTLManagedObjectAdapter managedObjectFromModel:member insertingIntoContext:localContext error:nil];
    } completion:^(BOOL success, NSError *error) {
        NSLog(@"%@", [[MemberManaged MR_findFirst] url].class);
        NSLog(@"%lu", (unsigned long)[MemberManaged MR_findAll].count);
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
