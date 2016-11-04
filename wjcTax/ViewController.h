//
//  ViewController.h
//  JCTax
//
//  Created by wjc on 16/10/25.
//  Copyright © 2016年 wjc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textRevenue;
@property (weak, nonatomic) IBOutlet UILabel *lblTax;

// 计算个人所得税
- (NSString *)calculate:(NSString *)revenue;

- (IBAction)onClick:(id)sender;

@end

