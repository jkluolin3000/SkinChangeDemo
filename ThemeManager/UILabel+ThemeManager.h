//
//  UILabel+ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(ThemeManager)
//UIView背景颜色名称
@property (nonatomic,strong) NSString* textColorName;
@property (nonatomic,strong) NSString* highlightedTextColorName;

-(void)initTextColor:(NSString*)colorName;
-(void)initHighlightedTextColor:(NSString*)colorName;
@end
