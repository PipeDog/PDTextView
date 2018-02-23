//
//  PDTextView.m
//  PDTextView
//
//  Created by liang on 2018/2/23.
//  Copyright © 2018年 PipeDog. All rights reserved.
//

#import "PDTextView.h"

@interface PDTextView ()

@end

@implementation PDTextView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configParams];
        [self addObserver];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configParams];
        [self addObserver];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configParams];
        [self addObserver];
    }
    return self;
}

- (void)configParams {
    _placeholderFont = [UIFont systemFontOfSize:13];
    _placeholderColor = [UIColor grayColor];
}

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textDidChange:(NSNotification *)notification {
    [self setNeedsDisplay];
}

#pragma mark - DrawRect
- (void)drawRect:(CGRect)rect {
    if (self.text.length > 0) return;

    CGFloat top, left, width, height;
    top = self.textContainerInset.top;
    left = self.textContainerInset.left + 4;
    width = CGRectGetWidth(self.bounds) - left - self.textContainerInset.right;
    height = CGRectGetHeight(self.bounds) - top - self.textContainerInset.bottom;
    
    CGRect drawInRect = CGRectMake(left, top, width, height);
    NSDictionary *dictionary = @{NSFontAttributeName: _placeholderFont,
                                 NSForegroundColorAttributeName: _placeholderColor};
    [self.placeholder drawInRect:drawInRect withAttributes:dictionary];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self setNeedsDisplay];
}

#pragma mark - Setter Methods
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    [self setNeedsDisplay];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

@end
