//
//  SViewController.m
//  Test
//
//  Created by beik on 11/25/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import "SViewController.h"

#import "CommonTool.h"
@interface SViewController ()

@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)show:(id)sender{
    NSLog(@"%@", [CommonTool topMostController]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
