//
//  PDTextView.h
//  PDTextView
//
//  Created by liang on 2018/2/23.
//  Copyright © 2018年 PipeDog. All rights reserved.
//

#import <UIKit/UIKit.h>

// If you want to config placeholder inset, set attribute textContainerInset.

IB_DESIGNABLE

@interface PDTextView : UITextView

@property (nonatomic, copy) IBInspectable NSString *placeholder;
// Placeholder style.
@property (nonatomic, strong) IBInspectable UIFont *placeholderFont;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

@end
