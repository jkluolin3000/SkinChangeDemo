//
//  UITextView+ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/11/2.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView(ThemeManager)
@property (nonatomic,strong) NSString* textColorName;
-(void)initTextColor:(NSString*)colorName;
@end
