//
//  XMKeyboardToolBar.m
//  XMStore
//
//  Created by Wangchaoqun on 15/1/4.
//  Copyright (c) 2015年 XM. All rights reserved.
//

#import "XMKeyboardToolBar.h"

@implementation XMKeyboardToolBar

+ (id)keyboardTool
{
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"KeyboardTool" owner:nil options:nil]
    ;
    return array[0];
}

#pragma mark - 点击事件
- (void)cannelBtnClick:(id)sender
{
    if ([_toolDelegate respondsToSelector:@selector(keyboardTool: buttonType:)]) {
        [_toolDelegate keyboardTool:self buttonType:kKeyboardToolButtonTypeCannel];
    }
}


- (void)doneBtnClick:(id)sender
{
    if ([_toolDelegate respondsToSelector:@selector(keyboardTool: buttonType:)]) {
        [_toolDelegate keyboardTool:self buttonType:kKeyboardToolButtonTypeDone];
    }
    
}
@end
