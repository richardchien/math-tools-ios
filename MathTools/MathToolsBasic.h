//
//  MathTools.h
//  MathTools
//
//  Created by Richard Chien on 13-8-20.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EquationSolver.h"
#import "AnalyticGeometry.h"

#define MATHTOOLS_THEME_COLOR [UIColor colorWithRed:0.906 green:0.353 blue:0.322 alpha:1.000]

NSString *const MTAccuracyKey = @"MTAccuracy";

static const int kDefaultAccuracy = 3;

@interface MathToolsBasic : NSObject

+ (NSInteger)preferenceAccuracy;
+ (void)setPreferenceAccuracy:(NSInteger)accuracy;
+ (NSString *)stringFromDoubleWithDefaultAccuracy:(double)d;
+ (NSString *)stringFromRationalNumber:(RationalNumber)rational;
+ (NSString *)stringFromQuadraticIrrational:(QuadraticIrrational)irrational;
+ (double)radianFromDegree:(double)deg;
+ (double)degreeFromRadian:(double)rad;

@end
