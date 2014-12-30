//
//  ShoppingCarViewController.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/22.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMViewController.h"

@interface ShoppingCarViewController :XMViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic,assign) int dataNumber;
@end
