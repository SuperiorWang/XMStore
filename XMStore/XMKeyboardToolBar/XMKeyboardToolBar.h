//
//  XMKeyboardToolBar.h
//  XMStore
//
//  Created by Wangchaoqun on 15/1/4.
//  Copyright (c) 2015年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum : NSUInteger {
    kKeyboardToolButtonTypeNext,     //下一个按钮
    kKeyboardToolButtonTypePrevious, //上一个按钮
    kKeyboardToolButtonTypeDone,     //完成按钮
    kKeyboardToolButtonTypeCannel,   //取消按钮
} KeyboardToolButtonType;

@class XMKeyboardToolBar;

@protocol KeyboardToolDelegate <NSObject>
- (void)keyboardTool:(XMKeyboardToolBar*)tool buttonType:(KeyboardToolButtonType)type;
@end

@interface XMKeyboardToolBar : UIToolbar

@property (nonatomic,weak) IBOutlet UIBarButtonItem *cannelButton;
@property (nonatomic,weak) IBOutlet UIBarButtonItem *doneButton;

@property (nonatomic,weak) id<KeyboardToolDelegate> toolDelegate;

+ (id)keyboardTool;

//监听工具条上 三个按钮的点击事件

- (IBAction)cannelBtnClick:(id)sender;
- (IBAction)doneBtnClick:(id)sender;

@end
