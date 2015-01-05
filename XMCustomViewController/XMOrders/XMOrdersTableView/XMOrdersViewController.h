//
//  XMOrdersViewController.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/30.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMOrdersCell.h"

@interface XMOrdersViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
