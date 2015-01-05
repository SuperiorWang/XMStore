//
//  XMOrdersCell.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/30.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XMOrdersCellDelegate <NSObject>

- (void)tableViewDidBeginCoordinate:(id)_ withKeyboardHeight:(CGSize)keyboardHeight; // 开始重新对UITableView排列Cell
- (void)tableVIewDidEndCoordinate:(id)_ withKeyboardHeight:(CGSize)keyboardHeight;   // 回复Cell
@end

@interface XMOrdersCell : UITableViewCell<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *unitPrice;
@property (weak, nonatomic) IBOutlet UITextField *numberProduct;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UIButton *showDetail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cannelOrders;
@property (weak, nonatomic) IBOutlet UILabel *payState;
@property (weak, nonatomic) IBOutlet UIButton *redButton;

@property (weak, nonatomic) id<XMOrdersCellDelegate> ordersDelegate;

@end
