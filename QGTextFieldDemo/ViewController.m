//
//  ViewController.m
//  QGTextField
//
//  Created by Qinggong on 2017/3/6.
//  Copyright © 2017年 Qinggong. All rights reserved.
//

#import "ViewController.h"
#import "QGTextField.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    QGTextField *textField = [[QGTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 40.0)];
    textField.center = self.view.center;
    textField.maxLength = 10;

    [self.view addSubview:textField];
}

@end
