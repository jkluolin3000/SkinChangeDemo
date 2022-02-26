//
//  ThemeConfig.m
//  SkinChangeDemo
//
//  Created by luolin on 16/1/31.
//  Copyright (c) 2016年 luolin. All rights reserved.
//

#import "ThemeConfig.h"

@implementation ThemeConfig

static ThemeConfig *mInstance = nil;

+ (ThemeConfig *)shareInstance
{
    if (nil == mInstance)
    {
        mInstance = [[ThemeConfig alloc] init];
        [mInstance loadThemeConfig];
    }
    return mInstance;
}

// 如果没有取到新的，则继续保持旧的数据
#define SAFE_SET_CONFIG_VALUE(key, configObj) \
if([rootDict objectForKey:key] != nil) { \
configObj = [[rootDict objectForKey:key] stringByRemoveRem]; \
}

#define SAFE_SET_CONFIG_BOOL(key, configObj) \
if([rootDict objectForKey:key] != nil) { \
configObj = [[rootDict objectForKey:key] boolValue]; \
}
#define SAFE_SET_CONFIG_OBJECT(key, configObj) \
if([rootDict objectForKey:key] != nil) { \
configObj = [rootDict objectForKey:key]; \
if([configObj isKindOfClass:NSString.class])\
{\
configObj = [(NSString*)configObj stringByRemoveRem];\
}\
}

- (void)loadThemeConfig
{
    NSString *fileName = @"ThemeConfig.plist";
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    NSString* path = [bundlePath stringByAppendingPathComponent: fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSDictionary* rootDict = [NSDictionary dictionaryWithContentsOfFile:path];
        self.themelist = [rootDict objectForKey:@"themelist"];
        NSString* currentTheme = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThemeManager_currentTheme"];
        if(currentTheme == nil && self.themelist != nil && self.themelist.count > 0)
        {
            NSString *theme = [self.themelist objectAtIndex:0];
            [[NSUserDefaults standardUserDefaults] setObject:theme forKey:@"ThemeManager_currentTheme"];
        }
    }
    
    [self reloadCurrentColorScheme];
}

-(void)reloadCurrentColorScheme
{
    NSString* currentTheme = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThemeManager_currentTheme"];
    if(currentTheme != nil)
    {
        NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
        NSString* path = [NSString stringWithFormat:@"%@/%@.bundle/ColorScheme.plist",bundlePath,currentTheme];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            self.currentColorSchemeDic = [NSDictionary dictionaryWithContentsOfFile:path];
        }
        else{
            self.currentColorSchemeDic = nil;
        }
    }
    else{
        self.currentColorSchemeDic = nil;
    }

}


@end
