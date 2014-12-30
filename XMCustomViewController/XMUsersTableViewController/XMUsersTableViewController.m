//
//  XMUsersTableViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/23.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMUsersTableViewController.h"
@interface XMUsersTableViewController()

@end

@implementation XMUsersTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
        
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
        
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            
        [cell setSeparatorInset:UIEdgeInsetsZero];
            
    }
        
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            
        [cell setLayoutMargins:UIEdgeInsetsZero];
            
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //点击了第一组
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:    //点击了我的订单
                break;
            case 1:    //点击了购物车
                self.tabBarController.selectedIndex = 3;   //跳转到购物车
                break;
            default:
                break;
        }
    }else{
        //点击了第二组
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self resetSeparator];
}

- (void)resetSeparator
{
    NSArray *visibleCells = self.tableView.visibleCells;
    UIEdgeInsets edgeInset = self.tableView.separatorInset;
    for (UITableViewCell * cell in visibleCells) {
        cell.separatorInset =  UIEdgeInsetsMake(edgeInset.top, 0, edgeInset.bottom, edgeInset.right);
    }
}
@end
