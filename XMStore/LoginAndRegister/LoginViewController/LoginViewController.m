//
//  LoginViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/24.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightitem;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackButtonImage];
}

#pragma mark - 设置返回按钮的图片 
- (void)setBackButtonImage
{
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0){
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationController.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"BackIndicatorImage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
}

- (IBAction)CancelModelViewController:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:^{
    }];
}

@end
