//
//  UIImageView+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/10/22.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UIImageView+ThemeManager.h"

@implementation UIImageView(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    
    if(self.imageName != nil)
    {
        [self setImage:GET_THEME_IMAGE(self.imageName)];
    }
    
    if(self.highlightedImageName != nil)
    {
        [self setHighlightedImage:GET_THEME_IMAGE(self.highlightedImageName)];
    }
    
    if (self.stretchableImageName != nil) {
        UIImage *btnImg = GET_THEME_IMAGE(self.stretchableImageName);
        UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
        [self setImage:btnImgStretchable];
    }
    
    if(self.tineImage != nil)
    {
        [self setImage:GET_TINE_IMAGE(self.tineImage)];
    }
    
    if (self.animationImageNames != nil) {
        [self stopAnimating];
        NSMutableArray *gifArray = [NSMutableArray array];
        NSUInteger count = [self.animationImageNames count];
        for (NSUInteger i = 0; i < count; i++) {
            UIImage *image = GET_THEME_IMAGE([self.animationImageNames objectAtIndex:i]);
            if (!image) {
                continue;
            }
            
            [gifArray addObject:image];
        }
        
        self.animationImages = gifArray;
        self.animationDuration = 1.0f;
        self.animationRepeatCount = 0;
        [self startAnimating];
    }
}

- (NSString *)imageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIImageView.imageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
    {
        return (NSString *)obj;
    }
    
    return nil;
}

- (void)setImageName:(NSString *)value
{
    if ( nil == value )
    {
        return;
    }
    
    objc_setAssociatedObject( self, @"UIImageView.imageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (NSString *)highlightedImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIImageView.highlightedImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setHighlightedImageName:(NSString *)value
{
    if ( nil == value )
        return;
    objc_setAssociatedObject( self, @"UIImageView.highlightedImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(void)initImage:(NSString *)imageName;
{
    if (!self.imageName) {
        [self setThemeNotifyObserver];
    }
    
    self.image = GET_THEME_IMAGE(imageName);
    self.imageName = imageName;
}

-(void)initHighlightedImage:(NSString *)imageName
{
    [self setThemeNotifyObserver];
    self.highlightedImage = GET_THEME_IMAGE(imageName);
    self.highlightedImageName = imageName;
}

- (NSString *)stretchableImageName
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIImageView.stretchableImageName" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
    {
        return (NSString *)obj;
    }
    
    return nil;
}

- (void)setStretchableImageName:(NSString *)value
{
    if ( nil == value ) {
        return;
    }
    
    objc_setAssociatedObject( self, @"UIImageView.stretchableImageName", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (UIImage *)tineImage
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIImageView.tineImage" );
    if ( obj && [obj isKindOfClass:[UIImage class]] )
    {
        return (UIImage *)obj;
    }
    
    return nil;
}

- (void)setTineImage:(UIImage *)value
{
    if ( nil == value ) {
        return;
    }
    
    objc_setAssociatedObject( self, @"UIImageView.tineImage", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

- (void)initStretchableImage:(NSString *)imageName {
    if (!self.stretchableImageName) {
        [self setThemeNotifyObserver];
    }
    
    UIImage *btnImg = GET_THEME_IMAGE(imageName);
    UIImage *btnImgStretchable = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width/2 topCapHeight:btnImg.size.height/2];
    [self setImage:btnImgStretchable];
    self.stretchableImageName = imageName;
}

-(void)initTineImage:(UIImage*)image
{
    if(image == nil)
        return;
    [self setThemeNotifyObserver];
    [self setImage:GET_TINE_IMAGE(image)];
    self.tineImage = image;
}

- (NSArray *)animationImageNames
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIImageView.animationImageNames" );
    if ( obj && [obj isKindOfClass:[NSArray class]] )
    {
        return (NSArray *)obj;
    }
    
    return nil;
}

- (void)setAnimationImageNames:(NSArray *)value
{
    if ( nil == value ) {
        return;
    }
    
    objc_setAssociatedObject( self, @"UIImageView.animationImageNames", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(void)initAnimationImages:(NSArray *)animationImageNames {
    if ((!animationImageNames) || ([animationImageNames count] <= 0)) {
        return;
    }
    
    UIImage *image = nil;
    
    [self setThemeNotifyObserver];
    NSMutableArray *gifArray = [NSMutableArray array];
    NSUInteger count = [animationImageNames count];
    for (NSUInteger i = 0; i < count; i++) {
        image = GET_THEME_IMAGE([animationImageNames objectAtIndex:i]);
        if (!image) {
            continue;
        }
        
        [gifArray addObject:image];
    }
    
    self.animationImages = (NSArray *)gifArray;
    self.animationDuration = 1.0f;
    self.animationRepeatCount = 0;
    [self startAnimating];
    self.animationImageNames = animationImageNames;
}
@end
