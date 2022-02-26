//
//  UILabel+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UILabel+ThemeManager.h"

@implementation UILabel(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    
    UP91ThemeManager * themeManger = [UP91ThemeManager sharedInstance];
    //处理颜色
    if(self.textColorName != nil)
    {
        UIColor *color = [themeManger getUP91ColorWithScheme:self.textColorName];
        if ((self.text) && ([self.text length] > 0)) {
            NSAttributedString *text = [[NSAttributedString alloc] initWithString:
                                            self.text attributes:@{NSForegroundColorAttributeName:color}];
            self.attributedText = text;
            self.textColor = color;
        }
        else {
           self.textColor = color;
        }
    }
    
    if(self.highlightedTextColorName)
    {
        self.highlightedTextColor = [themeManger getUP91ColorWithScheme:self.highlightedTextColorName];
//        UIColor *color = [themeManger getUP91ColorWithScheme:self.highlightedTextColorName];
//        if ((self.text) && ([self.text length] > 0)) {
//            NSAttributedString *text = [[NSAttributedString alloc] initWithString:
//                                        self.text attributes:@{NSForegroundColorAttributeName:color}];
//            self.attributedText = text;
//            self.highlightedTextColor = color;
//        }
//        else {
//            self.highlightedTextColor = color;
//        }
    }
}

- (NSString *)textColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UILabel.textColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setTextColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UILabel.textColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)highlightedTextColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UILabel.highlightedTextColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setHighlightedTextColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UILabel.highlightedTextColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(void)initTextColor:(NSString*)colorName
{
    if (!self.textColorName) {
        [self setThemeNotifyObserver];
    }
    
    self.textColor = GET_THEME_COLOR(colorName);
    self.textColorName = colorName;
}

-(void)initHighlightedTextColor:(NSString*)colorName
{
    [self setThemeNotifyObserver];
    self.highlightedTextColor = GET_THEME_COLOR(colorName);
    self.highlightedTextColorName = colorName;
}
@end
