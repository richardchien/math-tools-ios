//
//  RCViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-29.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCViewController.h"
#import "RCTrigViewController.h"

@interface RCViewController ()

@end

@implementation RCViewController

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
    [[UITextField appearance] setInputAccessoryView:self.inputBar.view];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1 && ![self isKindOfClass:[RCTrigViewController class]])
    {
        for (UIView *view in self.view.subviews)
        {
            CGRect rect = view.frame;
            rect.origin.y -= 44;
            view.frame = rect;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [[self.view viewWithTag:kFirstTextTag] becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITextField *)findFirstReponder
{
    for (UIView *subView in self.view.subviews) {
        if (subView.isFirstResponder && [subView isKindOfClass:[UITextField class]]) {
            return (UITextField *)subView;
        }
    }
    
    return nil;
}

- (IBAction)backgroundTap
{
    [[self findFirstReponder] resignFirstResponder];
}

- (IBAction)solve {;}

- (IBAction)clearAll {;}

- (RCInputAccessory *)inputBar
{
    if (!_inputBar) {
        _inputBar = [[RCInputAccessory alloc] init];
        _inputBar.delegate = self;
    }
    return _inputBar;
}

- (UIAlertView *)alert
{
    if (!_alert)
        _alert = [[UIAlertView alloc] initWithTitle: @"无法求解"
                                           message: @"您输入的数据无法求解，请检查输入后再试。"
                                          delegate: nil
                                 cancelButtonTitle: @"我知道了"
                                 otherButtonTitles: nil];
    return _alert;
}

@end
