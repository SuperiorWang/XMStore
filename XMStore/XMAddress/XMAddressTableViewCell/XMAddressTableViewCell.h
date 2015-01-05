//
//  XMAddressTableViewCell.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMAddressTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
