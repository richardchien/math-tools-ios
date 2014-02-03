//
//  RCCircleViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCCircleViewController.h"

@interface RCCircleViewController ()

@end

@implementation RCCircleViewController

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
    UITextField *x1Text = (UITextField *)[self.view viewWithTag:kX1TextTag];
    UITextField *y1Text = (UITextField *)[self.view viewWithTag:kY1TextTag];
    UITextField *x2Text = (UITextField *)[self.view viewWithTag:kX2TextTag];
    UITextField *y2Text = (UITextField *)[self.view viewWithTag:kY2TextTag];
    UITextField *x3Text = (UITextField *)[self.view viewWithTag:kX3TextTag];
    UITextField *y3Text = (UITextField *)[self.view viewWithTag:kY3TextTag];
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:kImgViewTag];
    UILabel *resultDLabel = (UILabel *)[self.view viewWithTag:kResultDTag];
    UILabel *resultELabel = (UILabel *)[self.view viewWithTag:kResultETag];
    UILabel *resultFLabel = (UILabel *)[self.view viewWithTag:kResultFTag];
    
    [[self findFirstReponder] resignFirstResponder];
    imgView.hidden = YES;
    resultDLabel.text = @"";
    resultELabel.text = @"";
    resultFLabel.text = @"";
    
    RCPoint P {frac(x1Text.text.doubleValue), frac(y1Text.text.doubleValue)};
    RCPoint Q {frac(x2Text.text.doubleValue), frac(y2Text.text.doubleValue)};
    RCPoint M {frac(x3Text.text.doubleValue), frac(y3Text.text.doubleValue)};
    
    if (![x1Text.text isEqualToString:@""] &&
        ![y1Text.text isEqualToString:@""] &&
        ![x2Text.text isEqualToString:@""] &&
        ![y2Text.text isEqualToString:@""] &&
        ![x3Text.text isEqualToString:@""] &&
        ![y3Text.text isEqualToString:@""] &&
        !([x1Text.text isEqualToString:x2Text.text] && [y1Text.text isEqualToString:y2Text.text]) &&
        !([x1Text.text isEqualToString:x3Text.text] && [y1Text.text isEqualToString:y3Text.text]) &&
        !([x3Text.text isEqualToString:x2Text.text] && [y3Text.text isEqualToString:y2Text.text])) {
        
        if (pointIsOnLine(P, LineWithTwoPoint(Q, M)))
            resultDLabel.text = @"此三点无法构成圆";
        else
        {
            Circle result = circleWithThreePoint(P, Q, M);
            
            NSString *resultDString;
            NSString *resultEString;
            NSString *resultFString;
            
            if ([MathToolsBasic stringFromRationalNumber:result.D].length <= kLineMaxChar &&
                [MathToolsBasic stringFromRationalNumber:result.E].length <= kLineMaxChar &&
                [MathToolsBasic stringFromRationalNumber:result.F].length <= kLineMaxChar)
            {
                resultDString = [NSString stringWithFormat: @"D = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:result.D], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.D.doubleValue()]];
                resultEString = [NSString stringWithFormat: @"E = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:result.E], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.E.doubleValue()]];
                resultFString = [NSString stringWithFormat: @"F = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:result.F], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.F.doubleValue()]];
            }
            else {
                resultDString = [NSString stringWithFormat: @"D ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.D.doubleValue()]];
                resultEString = [NSString stringWithFormat: @"E ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.E.doubleValue()]];
                resultFString = [NSString stringWithFormat: @"F ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.F.doubleValue()]];
            }
            
            imgView.hidden = NO;
            resultDLabel.text = resultDString;
            resultELabel.text = resultEString;
            resultFLabel.text = resultFString;
        }
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kX1TextTag; i <= kY3TextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    ((UIImageView *)[self.view viewWithTag:kImgViewTag]).hidden = YES;
    for (int i = kResultDTag; i <= kResultFTag; i ++)
        ((UILabel *)[self.view viewWithTag:i]).text = @"";
}

@end
