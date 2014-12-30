//
//  XMMailController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/29.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMMailController.h"

@interface XMMailController()

@property (weak, nonatomic) IBOutlet UILabel *headLabel;

@end
@implementation XMMailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.headLabel.adjustsFontSizeToFitWidth = YES;
}

@end
