//
//  QGTextField.h
//  QGTextField
//
//  Created by Qinggong on 2017/3/6.
//  Copyright © 2017年 Qinggong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QGTextField : UIView

/**
 *  限制输入的字符个数(汉字算两个字符)
 */
@property (assign, nonatomic) NSInteger maxLength;

@end
