//
//  UP91ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UP91ThemeManager.h"

#define ColorWithHexValue(hexValue, a) [UIColor colorWithRed:((hexValue >> 16) & 0x000000FF)/255.0f green:((hexValue >> 8) & 0x000000FF)/255.0f blue:((hexValue) & 0x000000FF)/255.0f alpha:a]

@interface UP91ThemeManager()
@property (nonatomic, strong, readwrite) NSString *currentTheme;
@property (nonatomic, strong, readwrite) NSArray *allThemes;
@property (nonatomic, strong, readwrite) NSDictionary *themesColorInfo;

@property (nonatomic, strong) NSString *bundlePath;
@end

@implementation UP91ThemeManager

+(UP91ThemeManager*)sharedInstance
{
    static UP91ThemeManager *ManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        ManagerInstance = [[self alloc] init];
    });
    return ManagerInstance;
}


+ (void)load
{
    [UIView hookdealloc];
}
-(id)init
{
    self = [super init];
    if(self)
    {
        self.allThemes = [ThemeConfig shareInstance].themelist;
        self.themesColorInfo = [ThemeConfig shareInstance].currentColorSchemeDic;
        self.currentTheme = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThemeManager_currentTheme"];
        if(self.currentTheme == nil)
        {
            self.currentTheme = [self.allThemes objectAtIndex:0];;
        }
    }
    return self;
}

-(void) setTheme:(NSString *)currentTheme
{
    self.currentTheme = currentTheme;
    [[NSUserDefaults standardUserDefaults] setObject:self.currentTheme forKey:@"ThemeManager_currentTheme"];
}

-(void)notifyThemeWillChange:(NSString *)newTheme
{
    self.currentTheme = newTheme;
    [[NSUserDefaults standardUserDefaults] setObject:self.currentTheme forKey:@"ThemeManager_currentTheme"];
    NSDictionary *userInfo = @{NEW_THEME_NAME:newTheme};
    [[ThemeConfig shareInstance] reloadCurrentColorScheme];
    self.themesColorInfo = [ThemeConfig shareInstance].currentColorSchemeDic;
//    //更新BundlePath路径
//    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @ "MyBundle" ofType :@ "bundle"];
//    NSString *bundle = [NSString stringWithFormat:@"%@.bundle",newTheme];
//    [self.bundlePath =[NSBundle mainBundle].resourcePath stringByAppendingString:bundle];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_THEME_WILL_CHANGE object:nil userInfo:nil];
}

-(UIImage*)getUP91ImageWithName:(NSString*)imageName
{
    NSString *name = [NSString stringWithFormat:@"%@.bundle/%@",self.currentTheme,imageName];
    UIImage *image = [UIImage imageNamed:name];
    return image;
}

-(UIColor*)getUP91ColorWithScheme:(NSString*)schemeName
{
    UIColor *color = nil;
    NSDictionary *themeColor = self.themesColorInfo;
    if(themeColor == nil)
        return nil;
    NSString *colorString =  [themeColor objectForKey:schemeName];
    if(colorString != nil)
    {
        NSArray * arr = [colorString componentsSeparatedByString:@","];
        if(arr != nil)
        {
            NSString *hax = [arr objectAtIndex:0];
            NSString *alpha = [arr objectAtIndex:1];
            if(hax != nil && alpha != nil)
            {
                unsigned long hex = strtoul([hax UTF8String],0,16);
                color = ColorWithHexValue(hex,alpha.floatValue);
            }
        }
    }
    return color;
}

-(UIImage*)getUP91TineImage:(UIImage*)orginImage
{
    if(orginImage == nil)
        return nil;
    if([self.currentTheme isEqualToString:@"DarkTheme"])
        return [orginImage setImageDarkenLevel:0.4];
    else
        return orginImage;
}

@end