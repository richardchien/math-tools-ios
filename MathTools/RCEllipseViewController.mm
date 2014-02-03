//
//  RCEllipseViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCEllipseViewController.h"

@interface RCEllipseViewController ()

@end

@implementation RCEllipseViewController

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
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:kImgViewTag];
    UILabel *resultMLabel = (UILabel *)[self.view viewWithTag:kResultMTag];
    UILabel *resultNLabel = (UILabel *)[self.view viewWithTag:kResultNTag];
    
    [[self findFirstReponder] resignFirstResponder];
    imgView.hidden = YES;
    resultMLabel.text = @"";
    resultNLabel.text = @"";
    
    RCPoint P {frac(x1Text.text.doubleValue), frac(y1Text.text.doubleValue)};
    RCPoint Q {frac(x2Text.text.doubleValue), frac(y2Text.text.doubleValue)};
    
    if (![x1Text.text isEqualToString:@""] &&
        ![y1Text.text isEqualToString:@""] &&
        ![x2Text.text isEqualToString:@""] &&
        ![y2Text.text isEqualToString:@""] &&
        !([x1Text.text isEqualToString:x2Text.text] && [y1Text.text isEqualToString:y2Text.text]) &&
        !(x1Text.text.doubleValue == 0 && y1Text.text.doubleValue == 0) &&
        !(x2Text.text.doubleValue == 0 && y2Text.text.doubleValue == 0)) {
        
        Ellipse result = ellipseWithThoPoint(P, Q);
        
        if (result.m == 0 || result.n == 0)
            resultMLabel.text = @"此两点无法构成椭圆或双曲线";
        else
        {
            if (result.m < 0)
            {
                result.m = result.m.changeSign();
                result.n = result.n.changeSign();
            }
            
            NSString *resultMString;
            NSString *resultNString;
            
            if ([MathToolsBasic stringFromRationalNumber:result.m].length <= kLineMaxChar &&
                [MathToolsBasic stringFromRationalNumber:result.n].length <= kLineMaxChar)
            {
                resultMString = [NSString stringWithFormat: @"m = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:result.m], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.m.doubleValue()]];
                resultNString = [NSString stringWithFormat: @"n = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:result.n], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.n.doubleValue()]];
            }
            else {
                resultMString = [NSString stringWithFormat: @"m ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.m.doubleValue()]];
                resultNString = [NSString stringWithFormat: @"n ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:result.n.doubleValue()]];
            }
            
            imgView.hidden = NO;
            resultMLabel.text = resultMString;
            resultNLabel.text = resultNString;
        }
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kX1TextTag; i <= kY2TextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    ((UIImageView *)[self.view viewWithTag:kImgViewTag]).hidden = YES;
    for (int i = kResultMTag; i <= kResultNTag; i ++)
        ((UILabel *)[self.view viewWithTag:i]).text = @"";
}

@end
