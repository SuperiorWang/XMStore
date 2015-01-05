//
//  XMAddressViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMAddressViewController.h"
#import "XMAddressTableViewCell.h"

@implementation XMAddressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationController.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-  (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"AddressCell";
    XMAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[XMAddressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.detailLabel.text = @"XXX 13100000000 \n浙江省杭州市滨江区 \n长河路475号何瑞国际广场S5幢5楼西";
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (IBAction)cannelModelView:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
