//
//  UIImageView+ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/10/22.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView(ThemeManager)
@property (nonatomic,strong) NSString* imageName;
@property (nonatomic,strong) NSString* highlightedImageName;
@property (nonatomic,strong) NSString* stretchableImageName;
@property (nonatomic,strong) UIImage* tineImage;
//动画图片数组
@property (nonatomic,strong) NSArray *animationImageNames;

-(void)initImage:(NSString *)imageName;
-(void)initHighlightedImage:(NSString *)imageName;
-(void)initStretchableImage:(NSString *)imageName;
-(void)initTineImage:(UIImage*)tineImage;
-(void)initAnimationImages:(NSArray *)animationImageNames;
@end
