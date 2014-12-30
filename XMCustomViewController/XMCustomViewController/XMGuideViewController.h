//
//  GuideViewController.h
//  Guide
//
//  Created by Wangchaoqun on 14/12/15.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGuideViewController : UIViewController<UIScrollViewDelegate>
{
    UIImageView         *_iamgeView;
    UIImageView         *_left;
    UIImageView         *_right;
    UIScrollView        *_pageScroll;
//    UIPageControl       *_pageControl;
    UIButton            *_gotoMainViewBtn;
    NSMutableDictionary *dic;
}

@property (nonatomic,retain) UIImageView *imageView;
@property (nonatomic,retain) UIImageView *left;
@property (nonatomic,retain) UIImageView *right;
@property (retain,nonatomic) UIScrollView  *pageScroll;
//@property (retain,nonatomic) UIPageControl *pageControl;
@property (retain,nonatomic) UIButton      *gotoMainViewBtn;

@end
