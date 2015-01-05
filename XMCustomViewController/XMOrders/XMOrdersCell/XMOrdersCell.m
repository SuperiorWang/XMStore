//
//  XMOrdersCell.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/30.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMOrdersCell.h"

@implementation XMOrdersCell
{
    CGSize keyboardSize; //获取键盘的高度
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self.payState sizeToFit];
        [self.totalPrice setAdjustsFontSizeToFitWidth:YES];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

#pragma mark - 键盘处理
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.ordersDelegate tableViewDidBeginCoordinate:nil withKeyboardHeight:keyboardSize];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.ordersDelegate tableVIewDidEndCoordinate:nil withKeyboardHeight:keyboardSize];
}

- (void)keyboardDidShow:(NSNotification*)noti
{
    NSDictionary *info = [noti userInfo];
    NSValue * value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    keyboardSize = [value CGRectValue].size;
}

- (void)keyboardDidHide:(NSNotification*)noti
{
    
}

@end
