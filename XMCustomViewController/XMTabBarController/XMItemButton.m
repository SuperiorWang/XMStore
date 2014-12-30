//
//  XMItemButton.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/19.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMItemButton.h"

#define MARGIN_PAR 0.6

@implementation XMItemButton

#pragma mark - 设置Button内部的image范围
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * MARGIN_PAR;
    return CGRectMake(0, 0, imageW, imageH);
}

#pragma mark - 设置Button内部的title范围
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * MARGIN_PAR;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}


@end
