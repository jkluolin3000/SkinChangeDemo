//
//  UITabBar+ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem(ThemeManager)

@property (nonatomic,strong) NSString* imageName;
@property (nonatomic,strong) NSString* selectedImageName;

@property (nonatomic,strong) NSString* normalTextColorName;
@property (nonatomic,strong) NSString* selectedTextColorName;

//响应主题改变的通知
-(void)onThemeWillChange;
//设置为通知观察者
-(void)setThemeNotifyObserver;
//去除通知
-(void)removeThemeNotify;
@end
