//
//  XMWebView.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/19.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XMWebViewDelegate <NSObject>

- (void)reloadData;

@end

@interface XMWebView : UIWebView

@property (nonatomic,assign) id<XMWebViewDelegate> XMdelegate;

@end
