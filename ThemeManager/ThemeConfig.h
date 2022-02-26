//
//  ThemeConfig.h
//  SkinChangeDemo
//
//  Created by luolin on 16/1/31.
//  Copyright (c) 2016年 luolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeConfig : NSObject
+ (ThemeConfig *)shareInstance;
@property (nonatomic, retain) NSArray* themelist;
@property (nonatomic, retain) NSDictionary* currentColorSchemeDic;
-(void)reloadCurrentColorScheme;
@end
