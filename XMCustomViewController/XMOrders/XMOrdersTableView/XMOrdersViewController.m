//
//  XMOrdersViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/30.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMOrdersViewController.h"

@implementation XMOrdersViewController
{
    CGPoint       offset;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"Cell";
    XMOrdersCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[XMOrdersCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    cell.numberProduct.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath = %@",indexPath);
}

#pragma mark - 处理键盘事件
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //计算偏移量
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
 
    XMOrdersCell  *currentCell ;
    currentCell = (XMOrdersCell*)textField.superview.superview.superview;
    
    CGRect currentCellRect =  [currentCell convertRect:currentCell.bounds toView:window];
    offset = self.tableView.contentOffset;
    
    CGFloat offsetY;
    offsetY = currentCellRect.origin.y - CGRectGetMaxY(self.navigationController.navigationBar.frame);
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.tableView setContentOffset:CGPointMake(0, offset.y + offsetY)];
    } completion:^(BOOL finished) {
        self.tableView.scrollEnabled = false;
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
#ifdef DEBUG
    NSLog(@"text Field Did End Editing");
#endif
    
    [self.tableView setContentOffset:CGPointMake(0, offset.y) animated:YES];
    self.tableView.scrollEnabled = true;
}

@end
