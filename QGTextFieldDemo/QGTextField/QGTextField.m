//
//  QGTextField.m
//  QGTextField
//
//  Created by Qinggong on 2017/3/6.
//  Copyright © 2017年 Qinggong. All rights reserved.
//

#import "QGTextField.h"

@interface QGTextField ()<UITextFieldDelegate>

@property (copy, nonatomic) NSString *textString;

@end

@implementation QGTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UITextField *textField = [[UITextField alloc] initWithFrame:frame];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.delegate = self;
        [textField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:textField];
    }
    return self;
}

- (void)textFieldEditingChanged:(UITextField *)textField
{
    NSString *temp = textField.text;
    int length = [self convertToInt:temp];
    if (length > self.maxLength) {
        textField.text = _textString;
    }
    _textString = textField.text;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string   // return NO to not change text
{
    if (string.length == 0) {
        return YES;
    }
    NSUInteger oldLength = [self convertToInt:textField.text];
    NSUInteger replacementLength = [self convertToInt:string];
    NSString *rangeStr = [textField.text substringWithRange:range];
    
    NSUInteger rangeLength = [self convertToInt:rangeStr];
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    return newLength <= self.maxLength || returnKey;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    [textField endEditing:YES];
    return YES;
}

- (int)convertToInt:(NSString*)strtemp {
    
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

@end
