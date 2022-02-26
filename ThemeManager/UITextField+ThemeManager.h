//
//  UITextField+ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/10/29.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField(ThemeManager)
@property (nonatomic,strong) NSString* textColorName;
@property (nonatomic,strong) NSString* placeholderColorName;

-(void)initTextColor:(NSString*)colorName;
-(void)initPlaceholderColor:(NSString*)ColorName;
@end
