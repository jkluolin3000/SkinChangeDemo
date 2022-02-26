//
//  UIWebView+ThemeManager.h
//  91upIphone
//
//  Created by chenyg on 15/10/31.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UIWebView+ThemeManager.h"
#import "UIColor+Change.h"

@implementation UIWebView(ThemeManager)
-(void)onThemeWillChange
{
    //处理颜色
    if(self.backgroundColorName != nil)
    {
        UIColor *color = GET_THEME_COLOR(self.backgroundColorName);
        self.opaque = NO;
        [self setBackgroundColor:color];
        //NSString *jsString = [NSString stringWithFormat:@"document.body.style.backgroundColor = '%@'", [color webColorString]];
        NSString *jsString = [NSString stringWithFormat:
                              @"document.getElementsByTagName('html')[0].style.backgroundColor= '%@'; DOMReady();",
                              [color webColorString]];
        [self stringByEvaluatingJavaScriptFromString:jsString];
        [self.scrollView setBackgroundColor:color];
    }
}

- (NSString *)backgroundColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIWebView.backgroundColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setBackgroundColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIWebView.backgroundColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(void)initBackgroundColor:(NSString*)colorName
{
    [self setThemeNotifyObserver];
    self.backgroundColorName = colorName;
}

@end
