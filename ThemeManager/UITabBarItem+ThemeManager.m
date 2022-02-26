//
//  UITabBar+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UITabBarItem+ThemeManager.h"

@implementation UITabBarItem(ThemeManager)

-(void)setThemeNotifyObserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onThemeWillChange) name:NOTIFY_THEME_WILL_CHANGE object:nil];
}

-(void)removeThemeNotify
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
}

-(void)onThemeWillChange
{
    UP91ThemeManager * themeManger = [UP91ThemeManager sharedInstance];
    //处理颜色
    if(self.normalTextColorName != nil)
    {
        [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[themeManger getUP91ColorWithScheme:self.normalTextColorName], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    }
    if(self.selectedTextColorName != nil)
    {
        [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[themeManger getUP91ColorWithScheme:self.normalTextColorName], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    }
    //处理image
    if(self.imageName != nil)
    {
        self.image = [themeManger getUP91ImageWithName:self.imageName];
    }
    
    if(self.selectedImageName != nil)
    {
        self.selectedImage = [themeManger getUP91ImageWithName:self.selectedImageName];
    }
}

- (NSString *)imageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UITabBarItem.imageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UITabBarItem.imageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)selectedImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UITabBarItem.selectedImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setSelectedImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UITabBarItem.selectedImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)normalTextColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UITabBarItem.normalTextColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setNormalTextColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UITabBarItem.normalTextColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)selectedTextColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UITabBarItem.selectedTextColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setSelectedTextColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UITabBarItem.selectedTextColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

@end
