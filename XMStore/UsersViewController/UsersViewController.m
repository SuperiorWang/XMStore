//
//  UsersViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/22.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "UsersViewController.h"

@implementation UsersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = 44.0f;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}
@end
