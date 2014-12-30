//
//  ShoppingCarCell.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/26.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeableCellDelegate <NSObject>
- (void)cellDidOpen:(UITableViewCell *)cell;
- (void)cellDidClose:(UITableViewCell *)cell;
@end

@interface ShoppingCarCell : UITableViewCell<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UIButton *productImage;
@property (weak, nonatomic) IBOutlet UITextField *productNumber;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UIView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * contentViewLeftConstraint;
@property (nonatomic, weak)  IBOutlet UIButton *deleteButton;
@property (nonatomic, weak) id <SwipeableCellDelegate> delegate;

- (void)openCell;

@end
