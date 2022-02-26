//
//  UIColor+Change.h
//  91upIphone
//
//  Created by chenyg on 15/10/31.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#ifndef UIColor_Change_h
#define UIColor_Change_h

#import <UIKit/UIKit.h>

@interface UIColor (Change)
///获取网页颜色字串
- (NSString *) webColorString;
///获取RGB值
- (CGFloat *) getRGB;
@end

#endif
