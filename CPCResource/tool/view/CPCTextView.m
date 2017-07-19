//
//  LYYTextView.m
//  baisibudejie
//
//  Created by Xiaoyue on 16/6/6.
//  Copyright © 2016年 李运洋. All rights reserved.
//

#import "CPCTextView.h"

@interface CPCTextView()


@end
@implementation CPCTextView
-(UILabel *)lab_maxLong{
    if (!_lab_maxLong) {
        CGFloat w=30;
        CGFloat h=30;
        CGFloat margin=10;
        _lab_maxLong=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-w-margin, self.frame.size.height-h-margin, w, h)];
        _lab_maxLong.text=[NSString stringWithFormat:@"%ld/%ld",self.text.length,_maxLong];
        _lab_maxLong.textAlignment=NSTextAlignmentCenter;
        
        _lab_maxLong.adjustsFontSizeToFitWidth=YES;
        
        

        [self addSubview:_lab_maxLong];
        
        
        
        
    }
    return _lab_maxLong;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup{
    //边框
    self.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth=0.5;
    self.layer.cornerRadius=5;
    
    //监听文字改变
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged) name:UITextViewTextDidChangeNotification object:nil];
    
    //设置默认颜色
    
    self.placeholderColor = [UIColor grayColor];
    
    self.font = [UIFont systemFontOfSize:14];
    //一直可以往下拖拽
    self.alwaysBounceVertical = YES;
    
    
    
    
        
    
    
    
    
    
    
}

-(void)setMaxLong:(NSInteger)maxLong{
    
    _maxLong=maxLong;
    
    
    self.lab_maxLong.text=[NSString stringWithFormat:@"%ld/%ld",self.text.length,_maxLong];
    
    
}



-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)textDidChanged
{
    [self setNeedsDisplay];
    
    
    
    
    
    /********************  字数限制   *******************/
    if (self.maxLong==0) {//如果没有字数限制 就执行
        return;
    }
    
    NSString *toBeString = self.text;
    
    NSArray *current = [UITextInputMode activeInputModes];
    
    UITextInputMode *currentInputMode = [current firstObject];
    
    NSString *lang = [currentInputMode primaryLanguage]; // 键盘输入模式
    
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        
        //获取高亮部分
        
        UITextRange *selectedRange = [self markedTextRange];
        
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        
        if (!position) {
            
            if (toBeString.length > _maxLong)
                
            {
                
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:_maxLong];
                
                if (rangeIndex.length == 1){
                    
                    self.text = [toBeString substringToIndex:_maxLong];
                    
                }else{
                    
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _maxLong)];
                    
                    self.text = [toBeString substringWithRange:rangeRange];
                    
                }
                
            }
            
        }else{//有高亮选择的字符串，则暂不对文字进行统计和限制
            
            
            
        }
        
    }else {// 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        
        if (toBeString.length > _maxLong){
            
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:_maxLong];
            
            if (rangeIndex.length == 1){
                
                self.text = [toBeString substringToIndex:_maxLong];
                
            }else{
                
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _maxLong)];
                
                self.text = [toBeString substringWithRange:rangeRange];
                
            }
            
        }
        
    }
    
    
    self.lab_maxLong.text=[NSString stringWithFormat:@"%ld/%ld",self.text.length,_maxLong];

    
}



/**
 *  绘制占位文字(每次调用draw之前 会把之前的擦掉);
 */
- (void)drawRect:(CGRect)rect {
   
    //如果有文字就直接返回 不会只占位文字
    if (self.hasText) return;
    rect.origin.x = 4;
    rect.origin.y = 7;
    rect.size.width -= 2*rect.origin.x;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor;
    
    [self.placeholder drawInRect:rect withAttributes:attrs];
    
    

}

//setter 方法

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    [self setNeedsDisplay];
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    
    [self setNeedsDisplay];
}
-(void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self setNeedsDisplay];
}
-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self setNeedsDisplay];
    
    
}









@end
