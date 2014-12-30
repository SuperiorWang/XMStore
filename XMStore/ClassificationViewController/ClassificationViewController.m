//
//  ClassificationViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/22.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMKit.h"
#import "Helper.h"
#import "XMTabBarController.h"
#import "XMGuideViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "ClassificationViewController.h"

@interface ClassificationViewController() <XMWebViewDelegate>
{
    EGORefreshTableHeaderView * _refreshHeaderView;
    BOOL _reloading;
}
@property (weak, nonatomic) IBOutlet XMWebView *webView;

@end

@implementation ClassificationViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadPage];
    
    _webView.XMdelegate = self;
}

#pragma mark - 加载数据
- (void)loadPage
{
    NSString *paramURLAsString = @"http://www.baidu.com";
    if ([paramURLAsString length] != 0) {
        NSURL *url = [NSURL URLWithString:paramURLAsString];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
}

- (void)reloadData{
    NSString *paramURLAsString = @"http://www.taobao.com";
    if ([paramURLAsString length] != 0) {
        NSURL *url = [NSURL URLWithString:paramURLAsString];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
}
@end
