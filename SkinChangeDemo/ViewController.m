//
//  ViewController.m
//  SkinChangeDemo
//
//  Created by luolin on 16/1/28.
//  Copyright (c) 2016年 luolin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *themeBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadUI
{
    UP91ThemeManager *themeMgr = [UP91ThemeManager sharedInstance];
    
    //UIView
    [self.view initBackgroundColor:@"colorScheme_1"];
    
    //UIButton
    self.themeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 70, 50, 140, 30)];
    [self.view addSubview:self.themeBtn];
    [self.themeBtn initNormalStretchableBkImage:@"common_btn_blue"];
    [self.themeBtn initHightlightedStretchableBkImage:@"common_btn_blue_hover"];
    [self.themeBtn initNormalTitleColor:@"colorScheme_1"];
    [self.themeBtn initDisabledStretchableBkImage:@"common_btn_gray"];
    if([themeMgr.currentTheme compare:@"LightTheme" options:NSCaseInsensitiveSearch] == NSOrderedSame)
    {
        [self.themeBtn setTitle:@"切换到晚上" forState:UIControlStateNormal];
    }
    else if([themeMgr.currentTheme compare:@"DarkTheme" options:NSCaseInsensitiveSearch] == NSOrderedSame)
    {
       [self.themeBtn setTitle:@"切换到白天" forState:UIControlStateNormal];
    }
    
    [self.themeBtn addTarget:self action:@selector(themeBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    //UIImage
    UIImageView *testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 12, 120, 24, 24)];
    [testImageView initImage:@"about_weixin"];
    [self.view addSubview:testImageView];
    
    //UIImage add tineColor
    UIImageView *testImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 28, 160, 56, 56)];
    [testImage initTineImage:GET_THEME_IMAGE(@"socialShare_WeixiSession")];
    [self.view addSubview:testImage];
    
    //UILabel
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 230, self.view.frame.size.width, 20)];
    testLabel.font = [UIFont systemFontOfSize:17];
    testLabel.text = @"UILabel主题皮肤测试";
    [testLabel initTextColor:@"colorScheme_3"];
    testLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:testLabel];
    
}

-(void)themeBtnPressed:(UIButton *)btn
{
    NSString *curtheme = [UP91ThemeManager sharedInstance].currentTheme;
    NSString *lightTheme = [[UP91ThemeManager sharedInstance].allThemes objectAtIndex:0];
    NSString *darkTheme = [[UP91ThemeManager sharedInstance].allThemes objectAtIndex:1];
    if([curtheme isEqualToString:lightTheme]) {
        [[UP91ThemeManager sharedInstance] notifyThemeWillChange:darkTheme];
        [self.themeBtn setTitle:@"切换到晚上" forState:UIControlStateNormal];
    }
    else {
        [[UP91ThemeManager sharedInstance] notifyThemeWillChange:lightTheme];
        [self.themeBtn setTitle:@"切换到白天" forState:UIControlStateNormal];
    }
}

@end
