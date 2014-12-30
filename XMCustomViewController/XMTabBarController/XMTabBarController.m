//
//  XMTabBarController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/19.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMTabBarController.h"
#import "XMItemButton.h"

@interface XMTabBarController ()

@end

@implementation XMTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
        [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName, nil]
        forState:
          UIControlStateNormal];
    
    UIColor *titleHighlightedColor = [UIColor colorWithRed:252/255.0 green:166/255.0 blue:168/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
     titleHighlightedColor,
      NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

#pragma mark - 在加载了StoryBoard后重载了按钮图片和文字颜色

+ (void)reloadItems:(UITabBarController*)tabBarController
{
    UITabBarItem *item = [tabBarController.tabBar.items objectAtIndex:0];
    [XMTabBarController tabBarItem:item setNormalImage:@"HomePage" AndSetSelectedImage:@"HomePage_Selected"];
    
    UITabBarItem *item1 = [tabBarController.tabBar.items objectAtIndex:1];
    
    [XMTabBarController tabBarItem:item1 setNormalImage:@"Classification" AndSetSelectedImage:@"Classification_Selected"];
    
    UITabBarItem *item2 = [tabBarController.tabBar.items objectAtIndex:2];
    
    [XMTabBarController tabBarItem:item2 setNormalImage:@"Users" AndSetSelectedImage:@"Users_Selected"];
    
    UITabBarItem *item3 = [tabBarController.tabBar.items objectAtIndex:3];
    
    [XMTabBarController tabBarItem:item3 setNormalImage:@"ShoppingCar" AndSetSelectedImage:@"ShoppingCar_Selected"];
    
    UITabBarItem *item4 = [tabBarController.tabBar.items objectAtIndex:4];
    
    [XMTabBarController tabBarItem:item4 setNormalImage:@"Message" AndSetSelectedImage:@"Message_Selected"];
}

+ (void)tabBarItem:(UITabBarItem*)item setNormalImage:(NSString*)image AndSetSelectedImage:(NSString*)selectedImage{
    [item setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

@end
