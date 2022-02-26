//
//  UITextView+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/11/2.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UITextView+ThemeManager.h"

@implementation UITextView(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    
    UP91ThemeManager * themeManger = [UP91ThemeManager sharedInstance];
    //处理颜色
    if(self.textColorName != nil)
    {
        self.textColor = [themeManger getUP91ColorWithScheme:self.textColorName];
    }
}

- (NSString *)textColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UITextView.textColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setTextColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UITextView.textColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(void)initTextColor:(NSString*)colorName
{
    [self setThemeNotifyObserver];
    self.textColor = GET_THEME_COLOR(colorName);
    self.textColorName = colorName;
}
@end
