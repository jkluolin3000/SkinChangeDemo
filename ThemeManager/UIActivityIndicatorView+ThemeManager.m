//
//  UIActivityIndicatorView+ThemeManager.m
//  91upIphone
//
//  Created by luolin on 15/11/4.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UIActivityIndicatorView+ThemeManager.h"

@implementation UIActivityIndicatorView(ThemeManager)

-(void)onThemeWillChange
{
    [super onThemeWillChange];
    //处理颜色
    if(self.changeWithThemeInfo != nil)
    {
        if([self.changeWithThemeInfo isEqualToString:@"need"])
        {
            if(self.activityIndicatorViewStyle == UIActivityIndicatorViewStyleWhite)
            {
                self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
            }
            else if(self.activityIndicatorViewStyle == UIActivityIndicatorViewStyleGray)
            {
                self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
            }
        }
        else if([self.changeWithThemeInfo isEqualToString:@"noNeed"])
        {
            
        }
    }
}

- (NSString *)changeWithThemeInfo
{
    NSObject * obj = objc_getAssociatedObject( self, @"UIActivityIndicatorView.changeWithThemeInfo" );
    if ( obj && [obj isKindOfClass:[NSString class]] )
        return (NSString *)obj;
    
    return nil;
}

- (void)setChangeWithThemeInfo:(NSString *)value
{
    if ( nil == value )
        return;
    
    objc_setAssociatedObject( self, @"UIActivityIndicatorView.changeWithThemeInfo", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}
@end
