//
//  MockTableTests.m
//  wjcTax
//
//  Created by wjc on 16/10/25.
//  Copyright © 2016年 wjc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TableDataSource.h"
#import "OCMock.h"

@interface MockTableTests : XCTestCase

@end

@implementation MockTableTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNumberOfRows {
    // 1.创建Table View的DataSource
    TableViewCellConfigureBlock cellConfigureBlock = ^(UITableViewCell *cell, NSString *item) {
        cell.textLabel.text = item;
    };
    
    TableDataSource *tableSource = [[TableDataSource alloc] initWithItems:@[@"1", @"2", @"3"]
                                                           CellIdentifier:@"foo"
                                                       ConfigureCellBlock:cellConfigureBlock];
    
    // 2.创建mock table view
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    
    // 3.断言
    XCTAssertEqual([tableSource tableView:mockTableView numberOfRowsInSection:0], (NSInteger)3, @"Mock table returns a bad number of rows in section 0");
}

- (void)testCellConfiguration {
    // 1.创建Table data source
    __block UITableViewCell *configuredCell = nil;
    __block id configuredObject = nil;
    TableViewCellConfigureBlock block = ^(UITableViewCell *a, id b) {
        configuredCell   = a;
        configuredObject = b;
    };
    TableDataSource *dataSource = [[TableDataSource alloc] initWithItems:@[@"a", @"b"]
                                                          CellIdentifier:@"foo"
                                                      ConfigureCellBlock:block];
    
    // 2.创建mock table view
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    
    // 3.设定mock table view的行为
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [[[mockTableView expect] andReturn:cell] dequeueReusableCellWithIdentifier:@"foo" forIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    //    [[[mockTableView stub] andReturn:cell] dequeueReusableCellWithIdentifier:@"foo" forIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    // 4.主动调用cellForRowAtIndexPath方法
    id result = [dataSource tableView:mockTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    // 5.验证mock table view的行为
    [mockTableView verify];
    
    // 6.断言
    XCTAssertEqual(result, cell, @"Should return the dummy cell.");
    XCTAssertEqual(configuredCell, cell, @"This should have been passed to the block.");
    XCTAssertEqualObjects(configuredObject, @"a", @"This should have been passed to the block.");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (int i = 0; i < 1000; i++) {
            NSLog(@"%@", @(i));
        }
    }];
}

@end
