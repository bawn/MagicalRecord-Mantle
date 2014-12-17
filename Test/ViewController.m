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
#import "CoreData+MagicalRecord.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int n = 0; n < 2; n++) {
        NSDictionary *dic = @{@"id" : @"1",
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
            NSLog(@"%d", [(MemberManaged *)[MemberManaged MR_findFirst] isVip].boolValue);
        }];
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
