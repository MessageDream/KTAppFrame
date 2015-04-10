//
//  SSTextView.m
//  SSToolkit
//
//  Created by Sam Soffes on 8/18/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//

#import "KTSSTextView.h"

@interface KTSSTextView ()
- (void)_initialize;
- (void)_updateShouldDrawPlaceholder;
- (void)_textChanged:(NSNotification *)notification;
@end


@implementation KTSSTextView {
    BOOL _shouldDrawPlaceholder;
}

#pragma mark - Accessors

@synthesize placeholder = _placeholder;
@synthesize placeholderColor = _placeholderColor;

- (void)setText:(NSString *)string {
    [super setText:string];
    [self _updateShouldDrawPlaceholder];
}


- (void)setPlaceholder:(NSString *)string {
    if ([string isEqual:_placeholder]) {
        return;
    }
    _placeholder = string;
    
    [self _updateShouldDrawPlaceholder];
}


#pragma mark - NSObject
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
    
}


#pragma mark - UIView
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self _initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self _initialize];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//    
//    if (_shouldDrawPlaceholder) {
//        [_placeholderColor set];
//        [_placeholder drawInRect:CGRectMake(8.0f, 8.0f, self.frame.size.width - 16.0f, self.frame.size.height - 16.0f) withFont:self.font];
//    }
    if( [[self placeholder] length] > 0 )
    {
        if ( _placeHolderLabel == nil )
        {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contentInset.left + 13.0f, self.contentInset.top + 8.0f, self.frame.size.width - self.contentInset.left - self.contentInset.right - 16.0f, self.frame.size.height - self.contentInset.top - self.contentInset.bottom - 16.0f)];
          //  _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
            _placeHolderLabel.lineBreakMode = UILineBreakModeWordWrap;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    [super drawRect:rect];
}


#pragma mark - Private
- (void)_initialize {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textChanged:) name:UITextViewTextDidChangeNotification object:self];
    
    self.placeholderColor = [UIColor colorWithWhite:0.702f alpha:1.0f];
    _shouldDrawPlaceholder = NO;
}

- (void)_updateShouldDrawPlaceholder {
  //  BOOL prev = _shouldDrawPlaceholder;
    _shouldDrawPlaceholder = self.placeholder && self.placeholderColor && self.text.length == 0;
    
    if (_shouldDrawPlaceholder) {
        //[self setNeedsDisplay];
        [[self viewWithTag:999] setAlpha:1];
    }else{
        [[self viewWithTag:999] setAlpha:0];
    }
}

- (void)_textChanged:(NSNotification *)notificaiton {
    [self _updateShouldDrawPlaceholder];
}

@end
