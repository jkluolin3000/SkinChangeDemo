//
//  UITableView+ThemeManager.m
//  91upIphone
//
//  Created by chenyg on 15/10/26.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UITabelView+ThemeManager.h"

#define UITABELVIEW_NORMAL_BKCOLORNAME   @"UITabelView.normalBackgroundColorName"

@implementation UITableView(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    //处理颜色
    if(self.normalBackgroundColorName != nil)
    {
        [self setBackgroundColor:GET_THEME_COLOR(self.normalBackgroundColorName)];
    }
}

- (NSString *)normalBackgroundColorName
{
    NSObject * obj = objc_getAssociatedObject( self,  UITABELVIEW_NORMAL_BKCOLORNAME );
    if ( obj && [obj isKindOfClass:[NSString class]] ) {
        return (NSString *)obj;
    }
    
    return nil;
}

- (void)setNormalBackgroundColorName:(NSString *)value
{
    if ( nil == value ) {
        return;
    }
    
    objc_setAssociatedObject( self, UITABELVIEW_NORMAL_BKCOLORNAME, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
    [self setBackgroundColor:GET_THEME_COLOR(value)];
}

@end
