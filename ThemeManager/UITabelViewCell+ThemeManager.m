//
//  UITableViewCell+ThemeManager.m
//  91upIphone
//
//  Created by chenyg on 15/10/26.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UITabelViewCell+ThemeManager.h"

#define UITABELVIEWCELL_NORMAL_BKCOLORNAME      @"UITabelViewCell.normalBackgroundColorName"
#define UITABELVIEWCELL_SELECETED_BKCOLORNAME   @"UITabelViewCell.selecetedBackgroundColorName"

@implementation UITableViewCell(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    //处理颜色
    UIColor *color = nil;
    if(self.normalBackgroundColorName != nil)
    {
        color = GET_THEME_COLOR(self.normalBackgroundColorName);
        [self setBackgroundColor:color];
    }
    if(self.selecetedBackgroundColorName != nil)
    {
        color = GET_THEME_COLOR(self.selecetedBackgroundColorName);
        self.selectedBackgroundView.backgroundColor = color;
    }
}

- (NSString *)normalBackgroundColorName
{
    NSObject * obj = objc_getAssociatedObject( self, UITABELVIEWCELL_NORMAL_BKCOLORNAME );
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
    
    objc_setAssociatedObject( self, UITABELVIEWCELL_NORMAL_BKCOLORNAME, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)selecetedBackgroundColorName
{
    NSObject * obj = objc_getAssociatedObject( self, UITABELVIEWCELL_SELECETED_BKCOLORNAME );
    if ( obj && [obj isKindOfClass:[NSString class]] ) {
        return (NSString *)obj;
    }
    
    return nil;
}

- (void)setSelecetedBackgroundColorName:(NSString *)value
{
    if ( nil == value ) {
        return;
    }
    
    objc_setAssociatedObject( self, UITABELVIEWCELL_SELECETED_BKCOLORNAME, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (void) initThemeParam:(NSString *)normalBackgroundColorName selecetedBackgroundColorName:(NSString *)selecetedBackgroundColorName {
    [self setThemeNotifyObserver];
    self.normalBackgroundColorName = normalBackgroundColorName;
    if (normalBackgroundColorName != nil) {
        self.backgroundColor = GET_THEME_COLOR(normalBackgroundColorName);
    }
    
    self.selecetedBackgroundColorName = selecetedBackgroundColorName;
    if (selecetedBackgroundColorName != nil) {
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = GET_THEME_COLOR(selecetedBackgroundColorName);
    }
}

@end
