//
//  XMAddressTableViewCell.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMAddressTableViewCell.h"

@implementation XMAddressTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        self.detailLabel.textAlignment = NSTextAlignmentLeft ;
    }
    return self;
}

@end
