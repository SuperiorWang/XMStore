//
//  XMAddAddressViewController.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMKeyboardToolBar.h"

typedef enum : NSUInteger {
    CITYVALUE ,
    DISTRICTVALUE,
    PROVINCEVALUE,
} XMAreaValue;

@interface XMAddAddressViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>


@property (weak, nonatomic ) IBOutlet UIPickerView *pickerView;
@property (strong,nonatomic) NSDictionary *pickerData;
@property (strong,nonatomic) NSArray      *pickerProvincesData;
@property (strong,nonatomic) NSArray      *pickerDistrictData;   //区
@property (strong,nonatomic) NSArray      *pickerCitiesData;     //市
@property (strong,nonatomic) NSArray      *pickerProvinceData;   //省

@end
