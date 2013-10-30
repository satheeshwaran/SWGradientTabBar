//
//  SWGradientTabBar.h
//  SWGradientTabBar
//
//  Created by Satheeshwaran on 10/30/13.
//  Copyright (c) 2013 Satheeshwaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWGradientTabBar : UITabBar

@property (nonatomic, assign) BOOL gradientVerticalFlag;

- (void)setTabBarGradientTintColors:(NSArray *)barTintGradientColors verticalFlag:(BOOL)flag;

@end
