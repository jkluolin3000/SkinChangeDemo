//
//  UIWebView+ThemeManager.h
//  91upIphone
//
//  Created by chenyg on 15/10/31.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#ifndef UIWebView_ThemeManager_h
#define UIWebView_ThemeManager_h
#import <UIKit/UIKit.h>

@interface UIWebView(ThemeManager)
//UIWebView背景颜色名称
@property (nonatomic,retain) NSString* backgroundColorName;
//响应主题改变的通知
-(void)onThemeWillChange;
//初始化，加快调用
-(void)initBackgroundColor:(NSString*)colorName;
@end
#endif
