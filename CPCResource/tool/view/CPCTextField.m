//
//  CPCTextField.m
//  球迷1
//
//  Created by 池鹏程 on 16/8/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCTextField.h"

@implementation CPCTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    
    
    /**** 光标颜色*/
    self.tintColor=c_textPlaceholdStartColor;
    /**** placehold颜色*/
    [self setValue:c_textPlaceholdColor forKeyPath:@"placeholderLabel.textColor"];
    /**** 文字大小*/
    [self setFont:c_textFont];
    /**** clear功能*/
    self.clearButtonMode=UITextFieldViewModeWhileEditing;
    

    
    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    
    
    
    
    
}

-(void)editingDidBegin{
    [self setValue:c_textPlaceholdStartColor forKeyPath:@"placeholderLabel.textColor"];
    
}
-(void)editingDidEnd{
    [self setValue:c_textPlaceholdColor forKeyPath:@"placeholderLabel.textColor"];
    
}



-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
        
    }
    
    return YES;    
    
}

@end
