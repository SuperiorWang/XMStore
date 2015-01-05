//
//  XMAddressViewController.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMAddressViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
