//
//  ViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/16.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMKit.h"
#import "Helper.h"
#import "XMTabBarController.h"
#import "XMHomeViewController.h"
#import "XMGuideViewController.h"
#import "EGORefreshTableHeaderView.h"


@interface XMHomeViewController ()<XMWebViewDelegate>

{
//    EGORefreshTableHeaderView * _refreshHeaderView;
    BOOL _reloading;
}
@property (weak, nonatomic) IBOutlet XMWebView *webView;

@end

@implementation XMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [XMTabBarController reloadItems:self.tabBarController];

    [self loadPage];
    
    _webView.XMdelegate = self;
    
    if ([[UIDevice currentDevice].systemVersion doubleValue]>= 7.0) {
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationController.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    }
}

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

#pragma mark - 加载引导页
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (![[[NSUserDefaults standardUserDefaults]objectForKey:shownedGuide] isEqualToString:shownGuidFlag]) {
        [self presentViewController:[[XMGuideViewController alloc]init] animated:NO completion:nil];
        [[NSUserDefaults standardUserDefaults]setObject:shownGuidFlag forKey:shownedGuide];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
