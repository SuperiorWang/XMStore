//
//  NoteDAO.m
//  XMStore
//
//  Created by Wangchaoqun on 14/12/17.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "NoteDAO.h"
#import "Note.h"
#import "NoteManagedObject.h"

@implementation NoteDAO

#pragma mark - 查询所有数据方法
- (NSMutableArray*)findAll {
    NSManagedObjectContext *ctx = [self managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:ctx];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"data" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    NSArray *listData = [ctx executeFetchRequest:request error:&error];
    
    NSMutableArray *resListData = [[NSMutableArray alloc]init];
    
    for (NoteManagedObject *mo in listData) {
        Note* note = [[Note alloc]init];
        note.date = mo.date;
        note.content = mo.content;
        [resListData addObject:note];
    }
    return resListData;
}

#pragma mark - 按主键查询数据库
- (Note*)findById:(Note*)model
{
    NSManagedObjectContext *ctx = [self managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:ctx];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date = %@",model.date];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *listData = [ctx executeFetchRequest:request error:&error];
    
    if ([listData count] > 0) {
        NoteManagedObject *mo = [listData lastObject];
        
        Note *note = [[Note alloc]init];
        note.date = mo.date;
        note.content = mo.content;
    
        return note;
    }
    
    return nil;
}

#pragma mark - 插入数据
- (int) create:(Note*)model
{
    NSManagedObjectContext *ctx = [self managedObjectContext];
    
    NoteManagedObject *note = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:ctx];
    [note setValue:model.content forKey:@"content"];
    [note setValue:model.date forKey:@"date"];
    
    note.date = model.date;
    note.content = model.content;
    
    NSError *savingError = nil;
    if ([self.managedObjectContext save:&savingError]) {
        NSLog(@"插入数据成功");
    }else {
        NSLog(@"插入数据失败");
        return -1;
    }
    return 0;
}


#pragma mark - 删除数据
- (int) remove:(Note*)model
{
    NSManagedObjectContext *ctx = [self managedObjectContext];
    
    NSEntityDescription  *entityDescription = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:ctx];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date = %@",model.date];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *listData = [ctx executeFetchRequest:request error:&error];
    
    if ([listData count] >0) {
        NoteManagedObject *note = [listData lastObject];
        [self.managedObjectContext deleteObject:note];
        
        NSError *savingError = nil;
        if ([self.managedObjectContext save:&savingError]) {
            NSLog(@"删除数据成功");
        }else {
            NSLog(@"删除数据失败");
            return -1;
        }
    }
    return 0;
}

#pragma mark - 修改数据
- (int) modify:(Note*)model {
    NSManagedObjectContext *ctx = [self managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:ctx];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date = %@",model.date];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *listData = [ctx executeFetchRequest:request error:&error];
    if ([listData count] > 0) {
        NoteManagedObject *note = [listData lastObject];
        note.content = model.content;
        
        NSError *savingError = nil;
        if ([self.managedObjectContext save:&savingError]) {
            NSLog(@"修改数据成功");
        }else {
            NSLog(@"修改数据失败");
            return -1;
        }
    }
    return 0;
}

@end
