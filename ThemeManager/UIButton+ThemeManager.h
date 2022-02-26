//
//  UIButton+ThemeManager.h
//  91upIphone
//
//  Created by luolin on 15/10/21.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIButton(ThemeManager)
@property (nonatomic,strong) NSString* normalTitleColorName;
@property (nonatomic,strong) NSString* hightlightedTitleColorName;
@property (nonatomic,strong) NSString* disabledTitleColorName;
@property (nonatomic,strong) NSString* selecetedTitleColorName;
//@property (nonatomic,strong) NSString *hightlightedBgColorName;

@property (nonatomic,strong) NSString* normalImageName;
@property (nonatomic,strong) NSString* hightlightedImageName;
@property (nonatomic,strong) NSString* disabledImageName;

@property (nonatomic,strong) NSString* normalBackgroundImageName;
@property (nonatomic,strong) NSString* hightlightedBackgroundImageName;
@property (nonatomic,strong) NSString* disabledBackgroundImageName;
//用于需要拉伸的btn背景
@property (nonatomic,strong) NSString* normalStretchableBkImageName;
@property (nonatomic,strong) NSString* hightlightedStretchableBkImageName;
@property (nonatomic,strong) NSString* disabledStretchableBkImageName;

@property (nonatomic,strong) UIImage* tineNormalImage;

-(void)initNormalTitleColor:(NSString *)colorName;
-(void)initHightlightedTitleColor:(NSString *)colorName;
-(void)initDisabledTitleColor:(NSString *)colorName;
-(void)initSelecetedTitleColor:(NSString *)colorName;
-(void)initHightlightedBgColor:(NSString *)colorName;

-(void)initNormalImage:(NSString *)imageName;
-(void)initHightlightedImage:(NSString *)imageName;
-(void)initDisabledImage:(NSString *)imageName;

-(void)initNormalBackgroundImage:(NSString *)imageName;
-(void)initHightlightedBackgroundImage:(NSString *)imageName;
-(void)initDisabledBackgroundImage:(NSString *)imageName;

-(void)initNormalStretchableBkImage:(NSString *)imageName;
-(void)initHightlightedStretchableBkImage:(NSString *)imageName;
-(void)initDisabledStretchableBkImage:(NSString *)imageName;
@end
