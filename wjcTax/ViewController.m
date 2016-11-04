//
//  ViewController.m
//  JCTax
//
//  Created by wjc on 16/10/25.
//  Copyright © 2016年 wjc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 计算个人所得税
- (NSString *)calculate:(NSString *)revenue {
    // 月应纳个人所得税税额
    double tax = 0.0f;
    
    if ([revenue length] > 0) {
        double dbRevenue = [revenue doubleValue];
        
        // 月应纳所得额
        double dbTaxRevenue = dbRevenue - 3500;
        
        // 月应纳税所得额不超过1500元
        if (dbTaxRevenue <= 1500) {
            tax = dbTaxRevenue * 0.03;
        }
    }
    
    NSString *strTax = [NSString stringWithFormat:@"%.2f", tax < 0 ? 0 : tax];
    
    return strTax;
}

- (IBAction)onClick:(id)sender {
    // 关闭键盘
    [self.textRevenue resignFirstResponder];
    self.lblTax.text = [self calculate:self.textRevenue.text];
}

@end
