//
//  MKSecureTextField.m
//
//  Created by Min Kwon on 5/31/14.
//  Copyright (c) 2014 Min Kwon. All rights reserved.
//

#import "MKSecureTextField.h"

@interface MKSecureTextField()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *hideLabel;
@property (nonatomic, strong) NSTimer *hideTimer;
@property (nonatomic, strong) NSTimer *blinkTimer;
@end

@implementation MKSecureTextField


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _textField.userInteractionEnabled = YES;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.placeholder = @"enter text";
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.delegate = self;
        
        self.hideLabel = [[UILabel alloc] initWithFrame:CGRectMake(6, 5, frame.size.width-10, frame.size.height-12)];
        _hideLabel.backgroundColor = [UIColor whiteColor];
        
        
        [self addSubview:_textField];
        [self addSubview:_hideLabel];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textFieldDidChange:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:nil];
        
    }
    return self;
}


- (void)textFieldDidChange:(NSNotification*)notification
{
    UITextField *textField = notification.object;
    if (textField == _textField)
    {
        NSString *text = textField.text;
        
        
        [self hideExceptLastCharacter:text];
        
        [self.hideTimer invalidate];
        self.hideTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                          target:self
                                                        selector:@selector(hideLastCharacter)
                                                        userInfo:nil
                                                         repeats:NO];
        

    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSRange range;
    
    range.location = _hideLabel.text.length - 1;
    range.length = 1;

    _hideLabel.text = [_hideLabel.text stringByReplacingCharactersInRange:range withString:@""];
    
    [_blinkTimer invalidate];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_hideLabel.text == nil)
    {
        _hideLabel.text =  @"|";
    }
    else
    {
        _hideLabel.text =  [_hideLabel.text stringByAppendingString:@"|"];
    }
    
    self.blinkTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkCursor) userInfo:nil repeats:YES];
}

- (void)hideExceptLastCharacter:(NSString*)string
{
    int length = [_textField.text length];
    
    NSString *s = @"";
    for (int i = 0; i < length-1; i++)
    {
        s = [s stringByAppendingString:@"●"];
    }
    
    if (_textField.text.length > 0)
    {
        _hideLabel.text = [s stringByAppendingString:[_textField.text substringFromIndex:_textField.text.length-1]];
        _hideLabel.text = [_hideLabel.text stringByAppendingString:@"|"];
    }
    else
    {
        _hideLabel.text = @"|";
    }
}

- (void)hideLastCharacter
{
    if (_hideLabel.text.length > 1)
    {
        NSRange range;
        range.location = [_hideLabel.text length]-2;
        range.length = 1;
        
        _hideLabel.text = [_hideLabel.text stringByReplacingCharactersInRange:range withString:@"●"];
    }
}

- (void)blinkCursor
{
    if (_hideLabel.text.length > 0)
    {
        static BOOL visible = YES;
        
        NSRange range;
        range.location = _hideLabel.text.length - 1;
        range.length = 1;
        
        if (visible)
        {
            _hideLabel.text = [_hideLabel.text stringByReplacingCharactersInRange:range withString:@" "];
        }
        else
        {
            _hideLabel.text = [_hideLabel.text stringByReplacingCharactersInRange:range withString:@"|"];
        }
        visible = !visible;
    }
}


- (void)dealloc
{
    [_hideTimer invalidate];
    [_blinkTimer invalidate];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
