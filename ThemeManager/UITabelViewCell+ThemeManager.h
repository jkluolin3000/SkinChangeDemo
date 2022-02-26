//
//  UITabelViewCell+ThemeManager.h
//  91upIphone
//
//  Created by chenyg on 15/10/26.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UITableViewCell(ThemeManager)
@property (nonatomic,strong) NSString *normalBackgroundColorName;
@property (nonatomic,strong) NSString *selecetedBackgroundColorName;
- (void) initThemeParam:(NSString *)normalBackgroundColorName selecetedBackgroundColorName:(NSString *)selecetedBackgroundColorName;
@end
