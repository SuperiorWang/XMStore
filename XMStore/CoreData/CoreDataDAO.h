//
//  CoreDataNote.h
//  XMStore
//
//  Created by Wangchaoqun on 14/12/17.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataDAO: NSObject

@property (readonly,strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly,strong,nonatomic) NSManagedObjectModel   *managedObjectModel;
@property (readonly,strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL*)applicationDocumentsDirectory;


@end
