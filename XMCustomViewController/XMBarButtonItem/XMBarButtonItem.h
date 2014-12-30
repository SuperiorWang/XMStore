//
//  XMBarButtonItem.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/24.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XMBarButtonItemDelegate <NSObject>

- (void)selectedItem;

@end

@interface XMBarButtonItem : UIBarButtonItem
+ (XMBarButtonItem*)leftItem;
- (void)setData;

@property (nonatomic) id<XMBarButtonItemDelegate> delegate;
@end
