//
//  UITextField+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/10/29.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UITextField+ThemeManager.h"

@implementation UITextField(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    
    UP91ThemeManager * themeManger = [UP91ThemeManager sharedInstance];
    //处理颜色
    if(self.textColorName != nil)
    {
        self.textColor = [themeManger getUP91ColorWithScheme:self.textColorName];
    }
    if(self.placeholderColorName != nil)
    {
        [self setValue:GET_THEME_COLOR(self.placeholderColorName) forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (NSString *)textColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UITextField.textColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setTextColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UITextField.textColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)placeholderColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UITextField.placeholderColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setPlaceholderColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UITextField.placeholderColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(void)initTextColor:(NSString*)colorName
{
    [self setThemeNotifyObserver];
    self.textColor = GET_THEME_COLOR(colorName);
    self.textColorName = colorName;
}
-(void)initPlaceholderColor:(NSString*)ColorName
{
    [self setThemeNotifyObserver];
    [self setValue:GET_THEME_COLOR(ColorName) forKeyPath:@"_placeholderLabel.textColor"];
    self.placeholderColorName = ColorName;
}
@end
