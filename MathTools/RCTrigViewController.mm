//
//  RCTrigViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCTrigViewController.h"

@interface RCTrigViewController ()

@end

@implementation RCTrigViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)variableChanged
{
    UITextField *variableText = (UITextField *)[self.view viewWithTag:kVarTextTag];
    UILabel *sinLabel = (UILabel *)[self.view viewWithTag:kSinResultTag];
    UILabel *cosLabel = (UILabel *)[self.view viewWithTag:kCosResultTag];
    UILabel *tanLabel = (UILabel *)[self.view viewWithTag:kTanResultTag];
    UILabel *cotLabel = (UILabel *)[self.view viewWithTag:kCotResultTag];
    
    if ([variableText.text isEqualToString:@""])
    {
        sinLabel.text = @"";
        cosLabel.text = @"";
        tanLabel.text = @"";
        cotLabel.text = @"";
    }
    else {
        double radian;
        
        UISegmentedControl *segment = (UISegmentedControl *)[self.view viewWithTag:kSegmentTag];
        BOOL isDeg = segment.selectedSegmentIndex;
        if (!isDeg)
            radian = variableText.text.doubleValue;
        else
            radian = [MathToolsBasic radianFromDegree:variableText.text.doubleValue];
        
        NSString *sinString = [NSString stringWithFormat:@"sin(%@%@) = %@", variableText.text, (isDeg ? @"˚" : @" rad"), [MathToolsBasic stringFromDoubleWithDefaultAccuracy:sin(radian)]];
        NSString *cosString = [NSString stringWithFormat:@"cos(%@%@) = %@", variableText.text, (isDeg ? @"˚" : @" rad"), [MathToolsBasic stringFromDoubleWithDefaultAccuracy:cos(radian)]];
        NSString *tanString = [NSString stringWithFormat:@"tan(%@%@) = %@", variableText.text, (isDeg ? @"˚" : @" rad"), [MathToolsBasic stringFromDoubleWithDefaultAccuracy:tan(radian)]];
        NSString *cotString = [NSString stringWithFormat:@"cot(%@%@) = %@", variableText.text, (isDeg ? @"˚" : @" rad"), [MathToolsBasic stringFromDoubleWithDefaultAccuracy:1/tan(radian)]];
        
        sinLabel.text = sinString;
        cosLabel.text = cosString;
        tanLabel.text = tanString;
        cotLabel.text = cotString;
    }
}

@end
