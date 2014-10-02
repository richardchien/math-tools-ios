//
//  RCSettings.h
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCTableViewController.h"
#import <MessageUI/MessageUI.h>

static const NSUInteger kFeedbackCellTag = 1;
static const NSUInteger kRateCellTag = 2;

@interface RCSettings : RCTableViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;
@property (weak, nonatomic) IBOutlet UIStepper *accuracyStepper;

- (IBAction)changeAccuracy:(UIStepper *)sender;

@end
