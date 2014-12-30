//
//  NoteManagedObject.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/17.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NoteManagedObject : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * date;

@end
