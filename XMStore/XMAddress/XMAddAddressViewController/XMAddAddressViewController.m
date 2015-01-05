//
//  XMAddAddressViewController.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "XMAddAddressViewController.h"

@interface XMAddAddressViewController ()<UITextFieldDelegate,UITextViewDelegate,KeyboardToolDelegate>
{
    BOOL keyboardVisible;   //键盘打开标示
}
@property (weak, nonatomic ) IBOutlet UILabel            *provinceLabel;//选择省的按钮
@property (weak, nonatomic ) IBOutlet UILabel            *districtLabel;//选择区的按钮
@property (weak, nonatomic ) IBOutlet UILabel            *citiesLabel;//选择市的按钮

@property (weak, nonatomic ) IBOutlet NSLayoutConstraint *pickerViewBottom;
@property (weak, nonatomic ) IBOutlet UIToolbar          *toolBar;
@property (weak, nonatomic ) IBOutlet UIScrollView       *scrollView;

@property (strong,nonatomic) NSArray           *dataArray;
@property (assign,nonatomic) XMAreaValue       areaValue;
@property (assign,nonatomic) NSString          *data;//省市区的字符串

@property (assign,nonatomic) CGFloat           offsetY; //TextField Y轴偏移量
@property (weak,  nonatomic) UITextField       *currentTextField;//当前的TextField;
@property (assign,nonatomic) CGSize            keyboardSize;//键盘的高度
@property (weak,  nonatomic) XMKeyboardToolBar *tool;
@end

@implementation XMAddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取城市数据
    [self resolveData];
    
    [self.view bringSubviewToFront:self.pickerView];
    
    //隐藏掉选择城市控件
    self.pickerViewBottom.constant = 300;
    
}

//解析Plist的数据
- (void)resolveData
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"area" ofType:@"plist"];
    NSArray *dataArray = [[NSArray alloc]initWithContentsOfFile:plistPath];
    
    NSMutableArray *province = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in dataArray) {
        [province addObject:[dic objectForKey:@"State"]];
    }
    self.pickerProvincesData = province;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 实现协议UIPickerViewDataSource方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.dataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.dataArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.data = [self.dataArray objectAtIndex:row];
}

#pragma mark - 选择省市区
- (IBAction)choiseProvinces:(id)sender {
    self.areaValue = PROVINCEVALUE;
    if (self.pickerViewBottom.constant != 0) {
        [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.pickerViewBottom.constant = 0;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.dataArray = self.pickerProvincesData;
            [self.pickerView reloadAllComponents];
        }];
    }else {
        self.dataArray = self.pickerProvincesData;
        [self.pickerView reloadAllComponents];
    }
}


- (IBAction)choiseCities:(id)sender {
    self.areaValue = CITYVALUE;
    if (self.pickerViewBottom.constant != 0) {
        [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.pickerViewBottom.constant = 0;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.dataArray = self.pickerProvincesData;
            [self.pickerView reloadAllComponents];
        }];
    }else {
        self.dataArray = self.pickerProvincesData;
        [self.pickerView reloadAllComponents];
    }
}


- (IBAction)choiseDistrict:(id)sender {
    self.areaValue = DISTRICTVALUE;
    if (self.pickerViewBottom.constant != 0) {
        [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.pickerViewBottom.constant = 0;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.dataArray = self.pickerProvincesData;
            [self.pickerView reloadAllComponents];
        }];
    }else {
        self.dataArray = self.pickerProvincesData;
        [self.pickerView reloadAllComponents];
    }
}

//pickerView Tool - 取消
- (IBAction)cannelPicker:(id)sender {
    if (self.pickerViewBottom.constant == 0) {
        [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.pickerViewBottom.constant = 300;
            [self.view layoutIfNeeded];
        }completion:^(BOOL finished){
            
        }];
    }
}

//pickerView Tool - 确定
- (IBAction)pickerDone:(id)sender {
    if (self.pickerViewBottom.constant == 0) {
        [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.pickerViewBottom.constant = 300;
            [self.view layoutIfNeeded];
        }completion:^(BOOL finished){
            if (self.data != nil) {
                switch (self.areaValue) {
                    //省
                    case PROVINCEVALUE:{
                        self.provinceLabel.text = self.data;
                        break;
                    }
                    //市
                    case CITYVALUE:{
                        self.citiesLabel.text = self.data;
                        break;
                    }
                    //区
                    case DISTRICTVALUE:{
                        self.districtLabel.text = self.data;
                        break;
                    }
                    default:
                        break;
                }
            }
        }];
    }
}

#pragma mark - 注册/取消键盘事件
- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [super viewWillDisappear:animated];
}

#pragma mark - 键盘处理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
#ifdef DEBUG
    NSLog(@"text Field ShouldBeginEditing");
#endif
    
    self.tool = [XMKeyboardToolBar keyboardTool];
    self.tool.backgroundColor = [UIColor clearColor];
    self.tool.barTintColor = [UIColor lightGrayColor];
    
    self.tool.toolDelegate = self;
    
    textField.inputAccessoryView = self.tool;
    
    self.currentTextField = textField;
    
    if (keyboardVisible) {  //如果键盘打开
        //获取textField的Y坐标
        UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
        CGFloat textFieldY = [textField convertRect:textField.bounds toView:window].origin.y;
        CGFloat textFieldH = [textField convertRect:textField.bounds toView:window].size.height;
        
        //获取NavigationBar的Bottom Y坐标
        CGFloat navigationY = CGRectGetMaxY(self.navigationController.navigationBar.frame);  //64.0
        
        if (textFieldY < navigationY) {
            CGFloat offsetDel = navigationY - textFieldY;
            self.offsetY -= offsetDel;
            
            for (NSLayoutConstraint *constraint in self.scrollView.superview.constraints) {
                if (constraint.firstItem == self.scrollView && constraint.firstAttribute == NSLayoutAttributeTop) {
                    [UIView animateWithDuration:0.4 animations:^{
                        constraint.constant += offsetDel;
                        [self.view layoutIfNeeded];
                    }];
                }
            }
        }else if (textFieldY + textFieldH > [UIScreen mainScreen].bounds.size.height - self.keyboardSize.height) {
            CGFloat offsetDel = textFieldY + textFieldH - [UIScreen mainScreen].bounds.size.height + self.keyboardSize.height;
            self.offsetY += offsetDel;
            
            for (NSLayoutConstraint *constraint in self.scrollView.superview.constraints) {
                if (constraint.firstItem == self.scrollView && constraint.firstAttribute == NSLayoutAttributeTop) {
                    [UIView animateWithDuration:0.4 animations:^{
                        constraint.constant -= offsetDel;
                        [self.view layoutIfNeeded];
                    }];
                }
            }
        }
        
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
#ifdef DEBUG
    NSLog(@"text Field Did End Editing");
#endif
}

- (void)keyboardDidShow:(NSNotification*)notif
{
    //如果键盘已经出现则忽略通知
    if (keyboardVisible) {
        return;
    }
    
    //获取键盘的高度
    NSDictionary *info = [notif userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    self.keyboardSize = [aValue CGRectValue].size;
    
    if (CGRectGetMaxY(self.currentTextField.frame) > ([UIScreen mainScreen].bounds.size.height - self.keyboardSize.height)){
        //计算该上移的距离
        self.offsetY = CGRectGetMaxY(self.currentTextField.frame) + self.keyboardSize.height - [UIScreen mainScreen].bounds.size.height;
        
        for (NSLayoutConstraint *constraint in self.scrollView.superview.constraints) {
            if (constraint.firstItem == self.scrollView && constraint.firstAttribute == NSLayoutAttributeTop) {
                [UIView animateWithDuration:0.4 animations:^{
                    constraint.constant -= self.offsetY;
                    [self.view layoutIfNeeded];
                }];
            }
        }
        
        keyboardVisible = YES;
    }
    
}

- (void)keyboardDidHide:(NSNotification*)notif
{
#ifdef DEBUG
    NSLog(@"key board Did Hide");
#endif
    
    [UIView animateWithDuration:0.5 animations:^{
        for (NSLayoutConstraint *constraint in self.scrollView.superview.constraints) {
            if (constraint.firstItem == self.scrollView && constraint.firstAttribute == NSLayoutAttributeTop) {
                constraint.constant += self.offsetY;
                [self.view layoutIfNeeded];
            }
        }
    }completion:^(BOOL finished) {
        self.offsetY = 0;
    }];
}

- (void)keyboardTool:(XMKeyboardToolBar *)tool buttonType:(KeyboardToolButtonType)type
{
    switch (type) {
        case kKeyboardToolButtonTypeDone:{
#ifdef DEBUG
            NSLog(@"点击完成按钮");
#endif
            [self.currentTextField resignFirstResponder];
            break;
        }
        case kKeyboardToolButtonTypeCannel:{
#ifdef DEBUG
            NSLog(@"点击取消按钮");
#endif
            [self.currentTextField resignFirstResponder];
            break;
        }
            
        default:
            break;
    }
}

@end
