//
//  SWViewController.m
//  SWGradientTabBar
//
//  Created by Satheeshwaran on 10/30/13.
//  Copyright (c) 2013 Satheeshwaran. All rights reserved.
//

#import "SWViewController.h"
#import "SWGradientTabBar.h"

#define YELLOW_COLOR @"ffb400"
#define LIGHT_GRAY_COLOR @"f1f1f1"
#define WHITE_COLOR @"ffffff"
#define BLUE_COLOR @"3bad9f"
#define DARK_GRAY_COLOR @"7b7b7b"
#define LIP_STICK_COLOR @"CB0748"
#define COFFE_COLOR @"D75438"
#define EVERGREEN_COLOR @"4CB609"

@interface SWViewController ()
@property (weak, nonatomic) IBOutlet SWGradientTabBar *tabBar;
@property (weak, nonatomic) IBOutlet SWGradientTabBar *tabBar1;
@property (weak, nonatomic) IBOutlet SWGradientTabBar *tabBar2;
@property (weak, nonatomic) IBOutlet SWGradientTabBar *tabBar3;
@property (weak, nonatomic) IBOutlet SWGradientTabBar *tabBar4;

@end

@implementation SWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor colorWithRed:0.f green:204.f blue:190.f alpha:1.f],[UIColor colorWithRed:157.f green:191.f blue:175.f alpha:1.f],nil];
    
    [self.tabBar setTabBarGradientTintColors:colors verticalFlag:YES];
    
    colors = [NSArray arrayWithObjects:[UIColor yellowColor],[UIColor blueColor],nil];
    
    [self.tabBar1 setTabBarGradientTintColors:colors verticalFlag:NO];

    colors = [NSArray arrayWithObjects:[self colorFromHexString:COFFE_COLOR],[self colorFromHexString:LIGHT_GRAY_COLOR],nil];
    
    [self.tabBar2 setTabBarGradientTintColors:colors verticalFlag:YES];

    colors = [NSArray arrayWithObjects:[self colorFromHexString:YELLOW_COLOR],[self colorFromHexString:EVERGREEN_COLOR],nil];
    
    [self.tabBar3 setTabBarGradientTintColors:colors verticalFlag:NO];

    colors = [NSArray arrayWithObjects:[self colorFromHexString:LIP_STICK_COLOR],[self colorFromHexString:LIGHT_GRAY_COLOR],nil];
    
    [self.tabBar4 setTabBarGradientTintColors:colors verticalFlag:YES];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3)
    { cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@", [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)], [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)], [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6)
    { cleanString = [cleanString stringByAppendingString:@"ff"];
        
    }
    
    unsigned int baseValue; [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue]; float red = ((baseValue >> 24) & 0xFF)/255.0f;
    
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
}

@end
