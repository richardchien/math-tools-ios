//
//  RationalNumber.h
//
//
//  Created by Richard Chien on 13-4-22.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#ifndef __Equation_Support_Fraction___Fraction__
#define __Equation_Support_Fraction___Fraction__

#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>
#include <math.h>
using namespace std;

class RationalNumber {
    
public:
    long numerator;
    long denominator;
    
    RationalNumber ();
    RationalNumber (long n, long d);
    ~RationalNumber () {};
    
    //Caculate methods
    RationalNumber add (RationalNumber f);
    RationalNumber subtract (RationalNumber f);
    RationalNumber multiply (RationalNumber f);
    RationalNumber divide (RationalNumber f);
    RationalNumber invert ();
    RationalNumber changeSign ();
    RationalNumber xSquared ();
    
    //Caculate operators
    RationalNumber operator = (const double lf);
    RationalNumber operator + (const RationalNumber& frac);
    RationalNumber operator + (const double lf);
    RationalNumber operator += (const RationalNumber& frac);
    RationalNumber operator += (const double lf);
    RationalNumber operator - (const RationalNumber& frac);
    RationalNumber operator - (const double lf);
    RationalNumber operator -= (const RationalNumber& frac);
    RationalNumber operator -= (const double lf);
    RationalNumber operator * (const RationalNumber& frac);
    RationalNumber operator * (const double lf);
    RationalNumber operator *= (const RationalNumber& frac);
    RationalNumber operator *= (const double lf);
    RationalNumber operator / (const RationalNumber& frac);
    RationalNumber operator / (const double lf);
    RationalNumber operator /= (const RationalNumber& frac);
    RationalNumber operator /= (const double lf);
    
    //Compare operators
    bool operator == (const RationalNumber& frac);
    bool operator == (const double lf);
    bool operator != (const RationalNumber& frac);
    bool operator != (const double lf);
    bool operator > (const RationalNumber& frac);
    bool operator > (const double lf);
    bool operator >= (const RationalNumber& frac);
    bool operator >= (const double lf);
    bool operator < (const RationalNumber& frac);
    bool operator < (const double lf);
    bool operator <= (const RationalNumber& frac);
    bool operator <= (const double lf);
    
    //Set and get methods
    void setFraction (long n, long d);
    double doubleValue () const;
    string stringValue () const;
    
    //Transform Methods
    void reduce ();
};

bool isInt(double a);
long commonDivisorOf(long a, long b);
long commonMultipleOf(long a, long b);
RationalNumber fractionFromDouble (double lf);
RationalNumber frac(double lf);

#endif /* defined(__Equation_Support_Fraction___Fraction__) */
