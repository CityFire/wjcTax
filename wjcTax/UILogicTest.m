//
//  UILogicTest.m
//  wjcTax
//
//  Created by wjc on 16/10/25.
//  Copyright © 2016年 wjc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "ViewController.h"

@interface UILogicTest : XCTestCase
{
    id txtField;
    id label;
    ViewController *controller;
}

@property (nonatomic, strong) id txtField;
@property (nonatomic, strong) id label;
@property (nonatomic, strong) ViewController *controller;

- (void)testCalculateWithOnClick;

@end

@implementation UILogicTest

@synthesize txtField = _txtField;
@synthesize label = _label;
@synthesize controller = _controller;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    txtField = (id)[OCMockObject mockForClass:[UITextField class]];
    label = (id)[OCMockObject mockForClass:[UILabel class]];
    controller = [[ViewController alloc] init];
    
    // 设置视图控制器总的控件
    // 设置文本字段控件属性
    [controller setValue:txtField forKey:@"textRevenue"];
    // 设置标签控件属性
    [controller setValue:label forKey:@"lblTax"];
}

- (void)testCalculateWithOnClick {
    [[[txtField stub] andReturn:@"5000"] text];
    [[txtField expect] resignFirstResponder];
    
    [[label expect] setText: @"45.00"];
    
    // 测试按钮点击事件
    [controller onClick:OCMOCK_ANY];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [txtField verify];
    [label verify];
    self.txtField = nil;
    self.label = nil;
    self.controller = nil;
    
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
