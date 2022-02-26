//
//  UIButton+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UIButton+ThemeManager.h"

@implementation UIButton(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    
    UP91ThemeManager * themeManger = [UP91ThemeManager sharedInstance];
    //处理颜色
    if(self.normalTitleColorName != nil)
    {
        [self setTitleColor:[themeManger getUP91ColorWithScheme:self.normalTitleColorName] forState:UIControlStateNormal];
    }
    if(self.hightlightedTitleColorName != nil)
    {
        [self setTitleColor:[themeManger getUP91ColorWithScheme:self.hightlightedTitleColorName] forState:UIControlStateHighlighted];
    }
    if(self.disabledTitleColorName != nil)
    {
        [self setTitleColor:[themeManger getUP91ColorWithScheme:self.disabledTitleColorName] forState:UIControlStateDisabled];
    }
    if (self.selecetedTitleColorName != nil) {
        [self setTitleColor:[themeManger getUP91ColorWithScheme:self.selecetedTitleColorName] forState:UIControlStateSelected];
    }
    
//    //选中的背景颜色
//    if(self.hightlightedBgColorName != nil)
//    {
//        UIColor *color = [themeManger getUP91ColorWithScheme:self.hightlightedBgColorName];
//        if (color) {
//            UIImage *bkFocusImage = [UIImage imageWithColor:color size:self.size];
//            [self setBackgroundImage:bkFocusImage forState:UIControlStateHighlighted];
//        }
//    }
    
    //处理button image
    if(self.normalImageName != nil)
    {
        [self setImage:[themeManger getUP91ImageWithName:self.normalImageName] forState:UIControlStateNormal];
    }
    if(self.hightlightedImageName != nil)
    {
        [self setImage:[themeManger getUP91ImageWithName:self.hightlightedImageName] forState:UIControlStateHighlighted];
    }
    if(self.disabledImageName != nil)
    {
        [self setImage:[themeManger getUP91ImageWithName:self.disabledImageName] forState:UIControlStateDisabled];
    }
    //处理button bkgroundimage
    if(self.normalBackgroundImageName != nil)
    {
        [self setImage:[themeManger getUP91ImageWithName:self.normalBackgroundImageName] forState:UIControlStateNormal];
    }
    if(self.hightlightedBackgroundImageName != nil)
    {
        [self setImage:[themeManger getUP91ImageWithName:self.hightlightedBackgroundImageName] forState:UIControlStateHighlighted];
    }
    if(self.disabledBackgroundImageName != nil)
    {
        [self setImage:[themeManger getUP91ImageWithName:self.disabledBackgroundImageName] forState:UIControlStateDisabled];
    }
    //处理拉伸的bkground
    if(self.normalStretchableBkImageName != nil)
    {
        UIImage *btnImg = GET_THEME_IMAGE(self.normalStretchableBkImageName);
        UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
        [self setBackgroundImage:btnImgStretchable forState:UIControlStateNormal];
    }
    if(self.hightlightedStretchableBkImageName != nil)
    {
        UIImage *btnImg = GET_THEME_IMAGE(self.hightlightedStretchableBkImageName);
        UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
        [self setBackgroundImage:btnImgStretchable forState:UIControlStateHighlighted];
    }
    if(self.disabledStretchableBkImageName != nil)
    {
        UIImage *btnImg = GET_THEME_IMAGE(self.disabledStretchableBkImageName);
        UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
        [self setBackgroundImage:btnImgStretchable forState:UIControlStateDisabled];
    }
    if(self.tineNormalImage != nil)
    {
        [self setImage:GET_TINE_IMAGE(self.tineNormalImage) forState:UIControlStateNormal];
    }
}

//文本颜色
- (NSString *)normalTitleColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.normalTitleColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setNormalTitleColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.normalTitleColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)hightlightedTitleColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.hightlightedTitleColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setHightlightedTitleColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.hightlightedTitleColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)disabledTitleColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.disabledTitleColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setDisabledTitleColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.disabledTitleColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

//- (NSString *)hightlightedBgColorName
//{
//    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.hightlightedBgColorName" );
//    if ( obj && [obj isKindOfClass:[NSString class]] ) {
//        return (NSString *)obj;
//    }
//    
//    return nil;
//}
//
//- (void)setHightlightedBgColorName:(NSString *)value
//{
//    if ( nil == value )
//        return;
//    
//    objc_setAssociatedObject( self, @"UIButton.hightlightedBgColorName",
//                             value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
//}

- (NSString *)selecetedTitleColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.selecetedTitleColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] ) {
        return (NSString *)obj;
    }
    
    return nil;
}

- (void)setSelecetedTitleColorName:(NSString *)value
{
    if ( nil == value ) {
        return;
    }
    
    objc_setAssociatedObject( self, @"UIButton.selecetedTitleColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

//背景图片
- (NSString *)normalImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.normalImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setNormalImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.normalImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)hightlightedImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.hightlightedImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setHightlightedImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.hightlightedImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)disabledImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.disabledImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setDisabledImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.disabledImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)normalBackgroundImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.normalBackgroundImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setNormalBackgroundImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.normalBackgroundImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)hightlightedBackgroundImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.hightlightedBackgroundImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setHightlightedBackgroundImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.hightlightedBackgroundImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)disabledBackgroundImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.disabledBackgroundImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setDisabledBackgroundImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.disabledBackgroundImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

//用于需要拉伸的btn背景
- (NSString *)normalStretchableBkImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.normalStretchableBkImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setNormalStretchableBkImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.normalStretchableBkImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)hightlightedStretchableBkImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.hightlightedStretchableBkImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setHightlightedStretchableBkImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.hightlightedStretchableBkImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)disabledStretchableBkImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.disabledStretchableBkImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setDisabledStretchableBkImageName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIButton.disabledStretchableBkImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (UIImage *)tineNormalImage
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIButton.tineNormalImage" );
    if ( obj && [obj isKindOfClass:[UIImage class]] )
    {
        return (UIImage *)obj;
    }
    
    return nil;
}

- (void)setTineNormalImage:(UIImage *)value
{
    if ( nil == value ) {
        [self setImage:nil forState:UIControlStateNormal];
        objc_setAssociatedObject( self, @"UIButton.tineNormalImage", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
        return;
    }
    
    objc_setAssociatedObject( self, @"UIButton.tineNormalImage", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(void)initNormalTitleColor:(NSString *)colorName
{
    [self setThemeNotifyObserver];
    [self setTitleColor:GET_THEME_COLOR(colorName) forState:UIControlStateNormal];
    self.normalTitleColorName = colorName;
}

-(void)initHightlightedTitleColor:(NSString *)colorName
{
    [self setThemeNotifyObserver];
    [self setTitleColor:GET_THEME_COLOR(colorName) forState:UIControlStateHighlighted];
    self.hightlightedTitleColorName = colorName;
}

-(void)initDisabledTitleColor:(NSString *)colorName
{
    [self setThemeNotifyObserver];
    [self setTitleColor:GET_THEME_COLOR(colorName) forState:UIControlStateDisabled];
    self.disabledTitleColorName = colorName;
}

-(void)initSelecetedTitleColor:(NSString *)colorName {
    [self setThemeNotifyObserver];
    [self setTitleColor:GET_THEME_COLOR(colorName) forState:UIControlStateSelected];
    self.selecetedTitleColorName = colorName;
}

//-(void)initHightlightedBgColor:(NSString *)colorName
//{
//    [self setThemeNotifyObserver];
//    UIColor *color = GET_THEME_COLOR(colorName);
//    if (color) {
//        UIImage *bkFocusImage = [UIImage imageWithColor:color size:self.size];
//        [self setBackgroundImage:bkFocusImage forState:UIControlStateHighlighted];
//    }
//    self.hightlightedBgColorName = colorName;
//}

-(void)initNormalImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    [self setImage:GET_THEME_IMAGE(imageName) forState:UIControlStateNormal];
    self.normalImageName = imageName;
}

-(void)initHightlightedImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    [self setImage:GET_THEME_IMAGE(imageName) forState:UIControlStateHighlighted];
    self.hightlightedImageName = imageName;
}

-(void)initDisabledImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    [self setImage:GET_THEME_IMAGE(imageName) forState:UIControlStateDisabled];
    self.disabledImageName = imageName;
}

-(void)initNormalBackgroundImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    [self setBackgroundImage:GET_THEME_IMAGE(imageName) forState:UIControlStateNormal];
    self.normalBackgroundImageName = imageName;
}

-(void)initHightlightedBackgroundImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    [self setBackgroundImage:GET_THEME_IMAGE(imageName) forState:UIControlStateHighlighted];
    self.hightlightedBackgroundImageName = imageName;
}

-(void)initDisabledBackgroundImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    [self setBackgroundImage:GET_THEME_IMAGE(imageName) forState:UIControlStateDisabled];
    self.disabledBackgroundImageName = imageName;
}

-(void)initNormalStretchableBkImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    UIImage *btnImg = GET_THEME_IMAGE(imageName);
    UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
    [self setBackgroundImage:btnImgStretchable forState:UIControlStateNormal];
    self.normalStretchableBkImageName = imageName;
}

-(void)initHightlightedStretchableBkImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    UIImage *btnImg = GET_THEME_IMAGE(imageName);
    UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
    [self setBackgroundImage:btnImgStretchable forState:UIControlStateHighlighted];
    self.hightlightedStretchableBkImageName = imageName;
}

-(void)initDisabledStretchableBkImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    UIImage *btnImg = GET_THEME_IMAGE(imageName);
    UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
    [self setBackgroundImage:btnImgStretchable forState:UIControlStateDisabled];
    self.disabledStretchableBkImageName = imageName;
}

@end
