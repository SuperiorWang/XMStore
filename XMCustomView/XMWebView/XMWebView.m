//
//  XMWebView.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/19.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMWebView.h"
#import "Helper.h"
#import "EGORefreshTableHeaderView.h"

@interface XMWebView() <UIWebViewDelegate,UIScrollViewDelegate,EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView * _refreshHeaderView;
    BOOL _reloading;
}
@end

@implementation XMWebView
@synthesize XMdelegate;

#pragma mark -  取消右侧滚动条
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = COLOR_CLEAR;
        for (UIView *view in self.subviews)
        {
            if ([view isKindOfClass:[UIScrollView class]]) {
                [(UIScrollView*)view setShowsVerticalScrollIndicator:NO];
            
                for (UIView *shadowView in view.subviews) {
                    if ([shadowView isKindOfClass:[UIImageView class]]) {
                        shadowView.hidden = YES;
                    }
                }
            }
        }
        
        self.delegate = self;
        self.scrollView.delegate = self;
        
        //初始化refreshView，添加到webview 的 scrollView子视图中
        if (_refreshHeaderView == nil) {
            _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-self.scrollView.bounds.size.height, self.scrollView.frame.size.width, self.scrollView.bounds.size.height)];
            _refreshHeaderView.delegate = self;
            [self.scrollView addSubview:_refreshHeaderView];
        }
        [_refreshHeaderView refreshLastUpdatedDate];
    }
    
    return self;
}


#pragma mark - webview delegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    _reloading = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.scrollView];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"load page error:%@", [error description]);
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.scrollView];
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    [XMdelegate reloadData];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
    return _reloading; // should return if data source model is reloading
    
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; // should return date data source was last changed
}


@end
