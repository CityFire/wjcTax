//
//  TableDataSource.h
//  UnitTestDemo
//
//  Created by CityFire on 14-3-19.
//  Copyright (c) 2014年 CityFire. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface TableDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)anItems
               CellIdentifier:(NSString *)aCellIdentifier
           ConfigureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
