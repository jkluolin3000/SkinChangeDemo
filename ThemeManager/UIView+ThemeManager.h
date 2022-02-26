//
//  UIView+ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(ServiceLiveloadPrivate)
+ (void *)swizzz:(Class)clazz method:(SEL)sel1 with:(SEL)sel2;
@end

@interface UIView(ThemeManager)

//UIView背景图片名称
//@property (nonatomic,retain) NSString* backgroundImageName;
//UIView背景颜色名称
@property (nonatomic,retain) NSString* backgroundColorName;
//UIView layer borderColor
@property (nonatomic,retain) NSString* borderColorName;
//UIView layer shadowColor
@property (nonatomic,retain) NSString* shadowColorName;

//响应主题改变的通知
-(void)onThemeWillChange;
//设置为通知观察者
-(void)setThemeNotifyObserver;

+ (void)hookdealloc;

//初始化，加快调用
-(void)initBackgroundImage:(NSString*)imageName;
-(void)initBackgroundColor:(NSString*)colorName;

-(void)initBorderColor:(NSString*)colorName;
-(void)initShadowColor:(NSString*)colorName;
@end
