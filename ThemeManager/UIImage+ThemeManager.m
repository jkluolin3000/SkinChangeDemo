//
//  UIImage+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/11/6.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UIImage+ThemeManager.h"

@implementation UIImage(ThemeManager)

-(UIImage*)setImageDarkenLevel:(CGFloat)level
{
    return [self tintedImageWithColor:[UIColor blackColor] level:level];
}

-(UIImage*)tintedImageWithColor:(UIColor*)color level:(CGFloat)level
{
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawInRect:imageRect];
    
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextSetAlpha(ctx, level);
    CGContextSetBlendMode(ctx, kCGBlendModeSourceAtop);
    CGContextFillRect(ctx, imageRect);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *darkImage = [UIImage imageWithCGImage:imageRef
                                             scale:self.scale
                                       orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    
    UIGraphicsEndImageContext();
    
    return darkImage;
}

@end
