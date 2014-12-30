//
//  FindBackPsdController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/29.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "FindBackPsdController.h"
@interface FindBackPsdController()
@property (weak, nonatomic) IBOutlet UIButton *mailButton;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UIView *phoneContainer;
@property (weak, nonatomic) IBOutlet UIView *mailContainer;

@end

@implementation FindBackPsdController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mailButton.selected = TRUE;
    self.phoneButton.selected = FALSE;
}

- (IBAction)sendToMail:(UIButton *)sender {
    if (self.mailButton.selected == FALSE) {
        self.mailButton.selected = !self.mailButton.selected;
        self.phoneButton.selected = !self.phoneButton.selected;
        [self.view bringSubviewToFront:self.mailContainer];
    }
}
- (IBAction)sendToPhone:(id)sender {
    if (self.phoneButton.selected == FALSE) {
        self.mailButton.selected = !self.mailButton.selected;
        self.phoneButton.selected = !self.phoneButton.selected;
        [self.view bringSubviewToFront:self.phoneContainer];
    }
    
}

@end
