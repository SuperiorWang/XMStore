//
//  XMPhoneNumberRegisterController.m
//  XMStore
//
//  Created by Wangchaoqun on 15/1/7.
//  Copyright (c) 2015年 XM. All rights reserved.
//

#import "XMPhoneNumberRegisterController.h"

#define UISCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@implementation XMPhoneNumberRegisterController
{
    float keyboardHeight;
    UITextField *currentTextField;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark -处理键盘事件
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}



- (void)keyboardDidShow:(NSNotification*)noti
{
    if (keyboardHeight == 0) {
        NSDictionary *dict = [noti userInfo];
        NSValue *value = [dict objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGSize keyboardSize = [value CGRectValue].size; //键盘尺寸
        keyboardHeight = keyboardSize.height;
        [self setTextFieldLocation:currentTextField];
    }
}

- (void)keyboardDidHide:(NSNotification*)noti
{
    [UIView animateWithDuration:0.4 animations:^{
        self.scrollView.contentOffset = CGPointMake(0, -CGRectGetMaxY(self.navigationController.navigationBar.frame));
    }completion:^(BOOL finished) {
        currentTextField = nil;
    }];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
#ifdef DEBUG
    NSLog(@"text Field Did Begin Editing");
#endif
    
    if (keyboardHeight != 0) {
        [self setTextFieldLocation:textField];
    }
    currentTextField = textField;
}

- (void)setTextFieldLocation:(UITextField*)textField
{
    //获得控件在当前显示屏中的位置
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    CGRect rect = [textField convertRect:textField.bounds toView:window];
    
    if ((rect.origin.y > CGRectGetMaxY(self.navigationController.navigationBar.frame)) && (CGRectGetMaxY(rect) < (UISCREENHEIGHT - keyboardHeight))) {
        return;
    }else if (CGRectGetMaxY(rect) > (UISCREENHEIGHT - keyboardHeight)) {
        
        [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            float offset = self.scrollView.contentOffset.y + (CGRectGetMaxX(rect) + keyboardHeight - UISCREENHEIGHT);
            self.scrollView.contentOffset = CGPointMake(0,offset);
        } completion:^(BOOL finished) {
            
        }];
    }else if (CGRectGetMinY(rect) < CGRectGetMaxY(self.navigationController.navigationBar.frame)) {
        [UIView animateWithDuration:0.4 animations:^{
            self.scrollView.contentOffset = CGPointMake(0, CGRectGetMinY(rect) - CGRectGetMaxY(self.navigationController.navigationBar.frame));
        }];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
#ifdef DEBUG
    NSLog(@"text Field Did End Editing");
#endif
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

@end
