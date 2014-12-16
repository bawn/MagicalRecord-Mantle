//
//  TableViewController.m
//  Test
//
//  Created by beik on 6/17/14.
//  Copyright (c) 2014 beik. All rights reserved.
//

#import "TableViewController.h"
#import "CommonTool.h"

@interface TableViewController ()

@end

@implementation TableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)show:(id)sender{
    NSLog(@"%@", [CommonTool getCurrentRootViewController]);
}

#pragma mark - UITableViewDelegate Method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
