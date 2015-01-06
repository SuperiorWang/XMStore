//
//  ShoppingCarViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/22.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "ShoppingCarViewController.h"
#import "ShoppingCarCell.h"
#import "EGORefreshTableHeaderView.h"

#define CELL @"shoppingCarIdentifier"
@interface ShoppingCarViewController()<EGORefreshTableHeaderDelegate,SwipeableCellDelegate>
{
    EGORefreshTableHeaderView * _refreshHeaderView;
    BOOL                        _reloading;
    CGPoint                     offset;
}

@property (nonatomic,strong) NSMutableSet *cellsCurrentlyEditing;

@end

@implementation ShoppingCarViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.dataNumber = 13;
    
    self.cellsCurrentlyEditing = [NSMutableSet new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataNumber;
}

#pragma mark - 设置个数

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 195;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = CELL;
    ShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil) {
        cell = [[ShoppingCarCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    
    //给相邻的Cell之间加间隔栏
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 180, self.table.frame.size.width, 15)];
    view.backgroundColor = self.table.backgroundColor;
    [cell addSubview:view];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.productNumber.delegate = self;
    cell.delegate = self;
    
    [cell.selectedButton addTarget:self action:@selector(selectedProduct:) forControlEvents:UIControlEventTouchUpInside];
    if ([self.cellsCurrentlyEditing containsObject:indexPath]) {
        [cell openCell];
    }
    return cell;
    
}

- (void)selectedProduct:(UIButton*)sender
{
    sender.selected = !sender.selected;
}

- (void)cellDidOpen:(UITableViewCell *)cell {
    NSIndexPath *currentEditingIndexPath = [self.table indexPathForCell:cell];
    [self.cellsCurrentlyEditing addObject:currentEditingIndexPath];
}

- (void)cellDidClose:(UITableViewCell *)cell {
    [self.cellsCurrentlyEditing removeObject:[self.table indexPathForCell:cell]];
}

#pragma mark - 处理键盘事件
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //计算偏移量
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    
    ShoppingCarCell  *currentCell ;
    currentCell = (ShoppingCarCell*)textField.superview.superview.superview;
    
    CGRect currentCellRect =  [currentCell convertRect:currentCell.bounds toView:window];
    offset = self.table.contentOffset;
    
    CGFloat offsetY;
    offsetY = currentCellRect.origin.y - CGRectGetMaxY(self.navigationController.navigationBar.frame);
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.table setContentOffset:CGPointMake(0, offset.y + offsetY)];
    } completion:^(BOOL finished) {
        self.table.scrollEnabled = false;
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
#ifdef DEBUG
    NSLog(@"text Field Did End Editing");
#endif
    
    [self.table setContentOffset:CGPointMake(0, offset.y) animated:YES];
    self.table.scrollEnabled = true;
}
@end
