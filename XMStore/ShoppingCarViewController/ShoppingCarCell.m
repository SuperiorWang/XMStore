//
//  ShoppingCarCell.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/26.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "ShoppingCarCell.h"

@interface ShoppingCarCell()

@property (nonatomic,strong) UIPanGestureRecognizer *panRecognizer;
@property (nonatomic,assign) CGPoint panSartPoint;

@property (nonatomic,assign) CGFloat startingRightLayoutConstraintConstant;   // 存储Cell的位置以判断是打开还是关闭的

@end
@implementation ShoppingCarCell

static CGFloat const KBounceValue = 20.0f;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panThisCell:)];
    self.panRecognizer.delegate = self;
    [self.scrollView addGestureRecognizer:self.panRecognizer];
}

//确保Cell在其回收重用时再次关闭
- (void)prepareForReuse
{
    [super prepareForReuse];
    [self resetConstraintContstantsToZero:NO notifyDelegateDidClose:NO];
}

#pragma mark - 手势滑动
- (void)panThisCell:(UIPanGestureRecognizer*)recognizer {
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:{
            self.panSartPoint = [recognizer translationInView:self.scrollView];
            self.startingRightLayoutConstraintConstant = self.contentViewRightConstraint.constant;
            NSLog(@"Pan Begin at %@",NSStringFromCGPoint(self.panSartPoint));
            break;
        }
        case UIGestureRecognizerStateChanged:{
            CGPoint currentPoint = [recognizer translationInView:self.scrollView];
            CGFloat deltaX = currentPoint.x - self.panSartPoint.x;
            
            BOOL panningLeft = NO;
            if (currentPoint.x < self.panSartPoint.x) {
                panningLeft = YES;
            }
            
            if (self.startingRightLayoutConstraintConstant == 0) {
                if (!panningLeft) {
                    CGFloat constant = MAX(-deltaX, 0);
                    if (constant == 0) {
                        [self resetConstraintContstantsToZero:YES notifyDelegateDidClose:NO];
                    }else {
                        self.contentViewRightConstraint.constant = constant;
                    }
                }else {
                    CGFloat constant = MIN(-deltaX, [self buttonTotalWidth]);
                    if (constant == [self buttonTotalWidth]) {
                        [self setConstraintsToShowAllButtons:YES notifyDelegateDidOpen:NO];
                    }else {
                        self.contentViewRightConstraint.constant = constant;
                    }
                }
            }else {
                CGFloat adjustment = self.startingRightLayoutConstraintConstant - deltaX;
                if (!panningLeft) {
                    CGFloat constant = MAX(adjustment, 0);
                    if (constant == 0) {
                        [self resetConstraintContstantsToZero:YES notifyDelegateDidClose:NO];
                    }else{
                        self.contentViewRightConstraint.constant = constant;
                    }
                }else {
                    CGFloat constant = MIN(adjustment, [self buttonTotalWidth]);
                    if (constant == [self buttonTotalWidth]) {
                        [self setConstraintsToShowAllButtons:YES notifyDelegateDidOpen:NO];
                    }else {
                        self.contentViewRightConstraint.constant = constant;
                    }
                }
                
                self.contentViewLeftConstraint.constant = -self.contentViewRightConstraint.constant;
            }
            NSLog(@"Pan Moved %f",deltaX);
            break;
        }
        case UIGestureRecognizerStateEnded:{
            if (self.startingRightLayoutConstraintConstant == 0) {
                CGFloat halfOfButtonOne = CGRectGetWidth(self.deleteButton.frame)/2;
                if (self.contentViewRightConstraint.constant >= halfOfButtonOne) {
                    [self setConstraintsToShowAllButtons:YES notifyDelegateDidOpen:YES];
                }else{
                    [self resetConstraintContstantsToZero:YES notifyDelegateDidClose:YES];
                }
            }else {
                CGFloat halfOfButtonOne = CGRectGetWidth(self.deleteButton.frame)/2;
                if (self.contentViewRightConstraint.constant >= halfOfButtonOne) {
                    [self setConstraintsToShowAllButtons:YES notifyDelegateDidOpen:YES];
                }else {
                    [self resetConstraintContstantsToZero:YES notifyDelegateDidClose:YES];
                }
            }
            NSLog(@"Pan Ended");
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            if (self.startingRightLayoutConstraintConstant == 0) {
                [self resetConstraintContstantsToZero:YES notifyDelegateDidClose:YES];
            }else{
                [self setConstraintsToShowAllButtons:YES notifyDelegateDidOpen:YES];
            }
            NSLog(@"Pan Cancelled");
            break;
        }
        default:
            break;
    }
}

#pragma mark - 计算滑动距离
- (CGFloat)buttonTotalWidth {
    return CGRectGetWidth(self.frame) - CGRectGetMinX(self.deleteButton.frame);
}

- (void)resetConstraintContstantsToZero:(BOOL)animated notifyDelegateDidClose:(BOOL)endEditing
{
    if (self.startingRightLayoutConstraintConstant == 0 && self.contentViewRightConstraint.constant == 0) {
        return;
    }
    
    self.contentViewRightConstraint.constant = -KBounceValue;
    self.contentViewLeftConstraint.constant = KBounceValue;
    
    [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
        self.contentViewRightConstraint.constant = 0;
        self.contentViewLeftConstraint.constant = 0;
        [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
            self.startingRightLayoutConstraintConstant = self.contentViewRightConstraint.constant;
        }];
    }];
}

- (void)setConstraintsToShowAllButtons:(BOOL)animated notifyDelegateDidOpen:(BOOL)notifyDelegate
{
    if (self.startingRightLayoutConstraintConstant == [self buttonTotalWidth]) {
        self.contentViewRightConstraint.constant = [self buttonTotalWidth];
        return;
    }
    
    self.contentViewLeftConstraint.constant = [self buttonTotalWidth] - KBounceValue;
    self.contentViewRightConstraint.constant = [self buttonTotalWidth] + KBounceValue;
    
    [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
        self.contentViewRightConstraint.constant = +[self buttonTotalWidth];
        self.contentViewLeftConstraint.constant = -[self buttonTotalWidth];
        
        [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
            self.startingRightLayoutConstraintConstant = self.contentViewRightConstraint.constant;
        }];
    }];
}

- (void)updateConstraintsIfNeeded:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    float duration = 0;
    if (animated) {
        duration = 0.1;
    }
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self layoutIfNeeded];
    } completion:completion];
}

#pragma mark -  告诉各个手势识别器他们可以同时工作
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)openCell{
    [self setConstraintsToShowAllButtons:NO notifyDelegateDidOpen:NO];
}

@end
