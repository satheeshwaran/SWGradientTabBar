//
//  SWGradientTabBar.m
//  SWGradientTabBar
//
//  Created by Satheeshwaran on 10/30/13.
//  Copyright (c) 2013 Satheeshwaran. All rights reserved.
//

#import "SWGradientTabBar.h"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface SWGradientTabBar ()

@property (nonatomic, strong) CAGradientLayer *tabBarGradientLayer;

@end

@implementation SWGradientTabBar
@synthesize gradientVerticalFlag;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void)setTabBarGradientTintColors:(NSArray *)barTintGradientColors verticalFlag:(BOOL)flag
{
    if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        return;
    
    self.gradientVerticalFlag = flag;
    
    if (!self.tabBarGradientLayer) {
        self.tabBarGradientLayer = [CAGradientLayer layer];
        self.tabBarGradientLayer.opacity = 0.5;
        self.tabBarGradientLayer.frame = self.bounds;
        self.tabBarGradientLayer.colors = barTintGradientColors;
        if(flag)
        {
        self.tabBarGradientLayer.startPoint = CGPointMake(0.0, 0.5); // start point of gradient drawing (left side)
        self.tabBarGradientLayer.endPoint = CGPointMake(1.0, 0.5);
        }
    }
    
    NSMutableArray *gradientColors = [NSMutableArray array];
    
    for (id Color in barTintGradientColors) {
        
        if([Color isKindOfClass:[UIColor class]])
           [gradientColors addObject:(id)[Color CGColor]];
        else
            [gradientColors addObject:Color];
        
    }
    
    [self.tabBarGradientLayer setColors:gradientColors];
    
}

#pragma mark - UIView

- (void)drawRect:(CGRect)rect
{

    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    [self.layer insertSublayer:self.tabBarGradientLayer atIndex:1];

}


@end
