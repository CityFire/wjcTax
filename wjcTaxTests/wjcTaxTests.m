//
//  wjcTaxTests.m
//  wjcTaxTests
//
//  Created by wjc on 16/10/25.
//  Copyright © 2016年 wjc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface wjcTaxTests : XCTestCase

@property (nonatomic, strong) ViewController *viewCV;

@end

@implementation wjcTaxTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.viewCV = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.viewCV = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    double dbRevenue = 5000;
    NSString *strRevenu = [NSString stringWithFormat:@"%f", dbRevenue];
    NSString *strTax = [self.viewCV calculate:strRevenu];
    
    // 如果不相等则会提示@“测试不通过”
    XCTAssertTrue([strTax doubleValue] == 45, @"期望值为: 45, 实际值为: %@", strTax);
    
    if ([strTax doubleValue] == 45) {
        NSLog(@"测试通过...");
    }
    else {
        NSLog(@"测试失败,期望值为: 45, 实际值为: %@", strTax);
    }

}

- (void)testPerformanceExample {
    // This is an example of a performance test case. 主要检测代码的执行性能
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for(int i = 0; i < 100; i++) {
            NSLog(@"dd");
        }
    }];
}

@end
