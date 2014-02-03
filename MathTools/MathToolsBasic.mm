//
//  MathTools.m
//  MathTools
//
//  Created by Richard Chien on 13-8-20.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#import "MathToolsBasic.h"

@implementation MathToolsBasic

+ (void)initialize
{
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    
    [defaultValues setObject:[NSNumber numberWithInteger:kDefaultAccuracy] forKey:MTAccuracyKey];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
}

+ (NSInteger)preferenceAccuracy
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:MTAccuracyKey];
}

+ (void)setPreferenceAccuracy:(NSInteger)accuracy
{
    [[NSUserDefaults standardUserDefaults] setInteger:accuracy forKey:MTAccuracyKey];
}

+ (NSString *)stringFromDoubleWithDefaultAccuracy:(double)d
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger accuracy = [defaults integerForKey:MTAccuracyKey];
    switch (accuracy) {
        case 1:return [NSString stringWithFormat:@"%.1f", d];
        case 2:return [NSString stringWithFormat:@"%.2f", d];
        case 3:return [NSString stringWithFormat:@"%.3f", d];
        case 4:return [NSString stringWithFormat:@"%.4f", d];
        case 5:return [NSString stringWithFormat:@"%.5f", d];
        case 6:return [NSString stringWithFormat:@"%.6f", d];
        default:return nil;
    }
}

+ (NSString *)stringFromRationalNumber:(RationalNumber)rational
{
    NSString *result = [NSString stringWithUTF8String:rational.stringValue().c_str()];
    return result;
}

+ (NSString *)stringFromQuadraticIrrational:(QuadraticIrrational)irrational
{
    NSString *result = [NSString stringWithUTF8String:irrational.stringValue().c_str()];
    return result;
}

+ (double)radianFromDegree:(double)deg
{
    return deg / 180 * M_PI;
}

+ (double)degreeFromRadian:(double)rad
{
    return rad / M_PI * 180;
}

@end
