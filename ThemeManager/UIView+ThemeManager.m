//
//  UIView+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UIView+ThemeManager.h"

static BOOL __theme_swizzled_liveload__ = NO;
static void (*__theme_dealloc_liveload__)( id, SEL );


@implementation NSObject(ServiceLiveloadPrivate)

+ (void *)swizzz:(Class)clazz method:(SEL)sel1 with:(SEL)sel2
{
    Method method;
    IMP implement;
    IMP implement2;
    
    method = class_getInstanceMethod( clazz, sel1 );
    implement = (void *)method_getImplementation( method );
    implement2 = class_getMethodImplementation( clazz, sel2 );
    method_setImplementation( method, implement2 );
    
    return implement;
}

@end

@implementation UIView(ThemeManager)
//@dynamic backgroundImageName;
@dynamic backgroundColorName;
@dynamic borderColorName;
@dynamic shadowColorName;
+ (void)hookdealloc
{
    if ( NO == __theme_swizzled_liveload__ )
    {
        __theme_dealloc_liveload__ = [self swizzz:[UIView class] method:@selector(dealloc) with:@selector(themeDealloc)];
        
        __theme_swizzled_liveload__ = YES;
    }
}

- (void)themeDealloc
{
//    if(self.backgroundImageName != nil)
//    {
//        [self.backgroundImageName release];
//        self.backgroundImageName = nil;
//    }
    if(self.backgroundColorName != nil)
    {
        [self.backgroundColorName release];
        self.backgroundColorName = nil;
    }
    if(self.borderColorName != nil)
    {
        [self.borderColorName release];
        self.borderColorName = nil;
    }
    if(self.shadowColorName != nil)
    {
        [self.shadowColorName release];
        self.shadowColorName = nil;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
    if ( __theme_dealloc_liveload__ )
    {
        __theme_dealloc_liveload__( self, _cmd );
    }
}


-(void)setThemeNotifyObserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onThemeWillChange) name:NOTIFY_THEME_WILL_CHANGE object:nil];
}

//-(void)dealloc
//{
//    //[super dealloc];
//    //[[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
//}
//- (void)willMoveToSuperview:(UIView *)newSuperview
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
//}

//- (void)didAddSubview:(UIView *)subview
//{
//    [super didAddSubview:subview];
//    [self setThemeNotifyObserver];
//}
//- (void)removeFromSuperview
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
//}
//- (void)willMoveToSuperview:(UIView *)newSuperview
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFY_THEME_WILL_CHANGE object:nil];
//}

-(void)onThemeWillChange
{
    UP91ThemeManager * themeManger = [UP91ThemeManager sharedInstance];
    //处理图片
//    if(self.backgroundImageName != nil)
//    {
//        self.backgroundImage = [themeManger getUP91ImageWithName:self.backgroundImageName];
//    }
    //处理颜色
    if(self.backgroundColorName != nil)
    {
        self.backgroundColor = [themeManger getUP91ColorWithScheme:self.backgroundColorName];
    }
    if(self.borderColorName != nil)
    {
        self.layer.borderColor = GET_THEME_COLOR(self.borderColorName).CGColor;
    }
    if(self.shadowColorName != nil)
    {
        self.layer.shadowColor = GET_THEME_COLOR(self.shadowColorName).CGColor;
    }
}

//- (NSString *)backgroundImageName
//{
//    NSObject * obj = objc_getAssociatedObject( self, @"UIView.backgroundImageName" );
//    if ( obj && [obj isKindOfClass:[NSString class]] )
//        return (NSString *)obj;
//    
//    return nil;
//}
//
//- (void)setBackgroundImageName:(NSString *)value
//{
//    if ( nil == value )
//        return;
//
//    objc_setAssociatedObject( self, @"UIView.backgroundImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
//}



- (NSString *)backgroundColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIView.backgroundColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setBackgroundColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIView.backgroundColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)borderColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIView.borderColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setBorderColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIView.borderColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)shadowColorName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIView.shadowColorName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setShadowColorName:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIView.shadowColorName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

//-(void)initBackgroundImage:(NSString*)imageName
//{
//    [self setThemeNotifyObserver];
//    self.backgroundImage = GET_THEME_IMAGE(imageName);
//    self.backgroundImageName = imageName;
//}

-(void)initBackgroundColor:(NSString*)colorName
{
    [self setThemeNotifyObserver];
    self.backgroundColor = GET_THEME_COLOR(colorName);
    self.backgroundColorName = colorName;
}

-(void)initBorderColor:(NSString*)colorName
{
    [self setThemeNotifyObserver];
    self.layer.borderColor = GET_THEME_COLOR(colorName).CGColor;
    self.borderColorName = colorName;
}
-(void)initShadowColor:(NSString*)colorName
{
    [self setThemeNotifyObserver];
    self.layer.shadowColor = GET_THEME_COLOR(colorName).CGColor;
    self.shadowColorName = colorName;
}

@end
