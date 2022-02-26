//
//  UP91ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeConfig.h"
#import "UIView+ThemeManager.h"
#import "UILabel+ThemeManager.h"
#import "UIButton+ThemeManager.h"
#import "UIImageView+ThemeManager.h"
#import "UITabelViewCell+ThemeManager.h"
#import "UITabelView+ThemeManager.h"
#import "UITextField+ThemeManager.h"
#import "UIWebView+ThemeManager.h"
#import "UITextView+ThemeManager.h"
#import "UIActivityIndicatorView+ThemeManager.h"
#import "UIImage+ThemeManager.h"


#define NOTIFY_THEME_WILL_CHANGE    @"NOTIFY_THEME_WILL_CHANGE"
#define NEW_THEME_NAME              @"NEW_THEME_NAME"

/********************************************获取主题配置参数********************************************/
//获取主题颜色
#define GET_THEME_COLOR(name)   [[UP91ThemeManager sharedInstance] getUP91ColorWithScheme:name]
//获取主题图片
#define GET_THEME_IMAGE(name)   [[UP91ThemeManager sharedInstance] getUP91ImageWithName:name]
//获取带亮度的图片
#define GET_TINE_IMAGE(name)   [[UP91ThemeManager sharedInstance] getUP91TineImage:name]

/********************************************获取主题配置参数********************************************/

@interface UP91ThemeManager : NSObject
@property (nonatomic, strong, readonly) NSString *currentTheme;
@property (nonatomic, strong, readonly) NSArray *allThemes;
@property (nonatomic, strong, readonly) NSDictionary *themesColorInfo;

+(UP91ThemeManager*)sharedInstance;

-(void)notifyThemeWillChange:(NSString *)newTheme;

-(UIImage*)getUP91ImageWithName:(NSString*)imageName;

-(UIColor*)getUP91ColorWithScheme:(NSString*)schemeName;

-(UIImage*)getUP91TineImage:(UIImage*)orginImage;

@end
