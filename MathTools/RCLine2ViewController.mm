//
//  RCLine2ViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCLine2ViewController.h"

@interface RCLine2ViewController ()

@end

@implementation RCLine2ViewController

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
    UITextField *x0Text = (UITextField *)[self.view viewWithTag:kX0TextTag];
    UITextField *y0Text = (UITextField *)[self.view viewWithTag:kY0TextTag];
    UITextField *AText = (UITextField *)[self.view viewWithTag:kATextTag];
    UITextField *BText = (UITextField *)[self.view viewWithTag:kBTextTag];
    UITextField *CText = (UITextField *)[self.view viewWithTag:kCTextTag];
    UILabel *resultLabel = (UILabel *)[self.view viewWithTag:kResultTag];
    
    [[self findFirstReponder] resignFirstResponder];
    resultLabel.text = @"";
    
    if (![x0Text.text isEqualToString:@""] &&
        ![y0Text.text isEqualToString:@""] &&
        ![AText.text isEqualToString:@""] &&
        ![BText.text isEqualToString:@""] &&
        ![CText.text isEqualToString:@""] &&
        !(AText.text.doubleValue == 0 && BText.text.doubleValue == 0)) {
        
        RCPoint P;
        P.x = frac(x0Text.text.doubleValue);
        P.y = frac(y0Text.text.doubleValue);
        Line L;
        L.A = frac(AText.text.doubleValue);
        L.B = frac(BText.text.doubleValue);
        L.C = frac(CText.text.doubleValue);
        
        QuadraticIrrational result = distanceBetweenPointAndLine(P, L);
        NSString *resultString;
        if ([MathToolsBasic stringFromQuadraticIrrational:result].length <= kLineMaxChar)
            resultString = [NSString stringWithFormat: @"d = %@\n≈ %@", [MathToolsBasic stringFromQuadraticIrrational:result], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.doubleValue()]];
        else
            resultString = [NSString stringWithFormat: @"d ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.doubleValue()]];
        resultLabel.text = resultString;
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kX0TextTag; i <= kCTextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    ((UILabel *)[self.view viewWithTag:kResultTag]).text = @"";
}

@end
