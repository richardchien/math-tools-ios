//
//  RCLE3ViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCLE3ViewController.h"

@interface RCLE3ViewController ()

@end

@implementation RCLE3ViewController

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

- (IBAction)solve
{
    UITextField *a1Text = (UITextField *)[self.view viewWithTag:kA1TextTag];
    UITextField *b1Text = (UITextField *)[self.view viewWithTag:kB1TextTag];
    UITextField *c1Text = (UITextField *)[self.view viewWithTag:kC1TextTag];
    UITextField *d1Text = (UITextField *)[self.view viewWithTag:kD1TextTag];
    UITextField *a2Text = (UITextField *)[self.view viewWithTag:kA2TextTag];
    UITextField *b2Text = (UITextField *)[self.view viewWithTag:kB2TextTag];
    UITextField *c2Text = (UITextField *)[self.view viewWithTag:kC2TextTag];
    UITextField *d2Text = (UITextField *)[self.view viewWithTag:kD2TextTag];
    UITextField *a3Text = (UITextField *)[self.view viewWithTag:kA3TextTag];
    UITextField *b3Text = (UITextField *)[self.view viewWithTag:kB3TextTag];
    UITextField *c3Text = (UITextField *)[self.view viewWithTag:kC3TextTag];
    UITextField *d3Text = (UITextField *)[self.view viewWithTag:kD3TextTag];
    UILabel *rootLabelX = (UILabel *)[self.view viewWithTag:kRootXTag];
    UILabel *rootLabelY = (UILabel *)[self.view viewWithTag:kRootYTag];
    UILabel *rootLabelZ = (UILabel *)[self.view viewWithTag:kRootZTag];
    
    [[self findFirstReponder] resignFirstResponder];
    rootLabelX.text = @"";
    rootLabelY.text = @"";
    rootLabelZ.text = @"";
    
    if (![a1Text.text isEqualToString: @""] &&
        ![b1Text.text isEqualToString: @""] &&
        ![c1Text.text isEqualToString: @""] &&
        ![d1Text.text isEqualToString: @""] &&
        ![a2Text.text isEqualToString: @""] &&
        ![b2Text.text isEqualToString: @""] &&
        ![c2Text.text isEqualToString: @""] &&
        ![d2Text.text isEqualToString: @""] &&
        ![a3Text.text isEqualToString: @""] &&
        ![b3Text.text isEqualToString: @""] &&
        ![c3Text.text isEqualToString: @""] &&
        ![d3Text.text isEqualToString: @""]) {
        
        ThreeUnknEquaRt root = solveThreeUnknownsEquation(frac(a1Text.text.doubleValue), frac(b1Text.text.doubleValue), frac(c1Text.text.doubleValue), frac(d1Text.text.doubleValue), frac(a2Text.text.doubleValue), frac(b2Text.text.doubleValue), frac(c2Text.text.doubleValue), frac(d2Text.text.doubleValue), frac(a3Text.text.doubleValue), frac(b3Text.text.doubleValue), frac(c3Text.text.doubleValue), frac(d3Text.text.doubleValue));
        
        NSString *rootStringX;
        NSString *rootStringY;
        NSString *rootStringZ;
        
        if ([MathToolsBasic stringFromRationalNumber:root.x].length <= kLineMaxChar &&
            [MathToolsBasic stringFromRationalNumber:root.y].length <= kLineMaxChar &&
            [MathToolsBasic stringFromRationalNumber:root.z].length <= kLineMaxChar)
        {
            rootStringX = [NSString stringWithFormat: @"x = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:root.x], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x.doubleValue()]];
            rootStringY = [NSString stringWithFormat: @"y = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:root.y], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.y.doubleValue()]];
            rootStringZ = [NSString stringWithFormat: @"z = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:root.z], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.z.doubleValue()]];
        }
        else {
            rootStringX = [NSString stringWithFormat: @"x ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x.doubleValue()]];
            rootStringY = [NSString stringWithFormat: @"y ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.y.doubleValue()]];
            rootStringZ = [NSString stringWithFormat: @"z ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.z.doubleValue()]];
        }
        
        rootLabelX.text = rootStringX;
        rootLabelY.text = rootStringY;
        rootLabelZ.text = rootStringZ;
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kA1TextTag; i <= kD3TextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    for (int i = kRootXTag; i <= kRootZTag; i ++)
        ((UILabel *)[self.view viewWithTag:i]).text = @"";
}

@end
