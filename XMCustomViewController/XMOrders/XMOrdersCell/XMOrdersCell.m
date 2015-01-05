//
//  XMOrdersCell.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/30.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMOrdersCell.h"

@implementation XMOrdersCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self.payState sizeToFit];
        [self.totalPrice setAdjustsFontSizeToFitWidth:YES];
    }
    
    return self;
}


@end
