//
//  XMBarButtonItem.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/24.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMBarButtonItem.h"
#import "XMViewController.h"

@implementation XMBarButtonItem

static XMBarButtonItem* item;

+ (XMBarButtonItem*)leftItem
{
    if (item == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            item = [[XMBarButtonItem alloc]init];
        });
    }
    return item;
}

- (void)setData
{
    [self setImage:[[UIImage imageNamed:@"messageIcon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setStyle:UIBarButtonItemStylePlain];
    [self setTarget:self];
    [self setAction:@selector(gotoMessageController)];
}

- (void)gotoMessageController
{
    [self.delegate selectedItem];
}
@end
