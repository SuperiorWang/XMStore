//
//  XMTableViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/24.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMTableViewController.h"

@implementation XMTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    XMBarButtonItem *item = [XMBarButtonItem leftItem];
    [item setData];
    item.delegate = self;
    self.navigationItem.rightBarButtonItem = item;
}

-(void)selectedItem
{
    self.tabBarController.selectedIndex = 4;
}
@end
