//
//  QuadraticIrrational.h
//
//
//  Created by Richard Chien on 13-11-19.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#ifndef __MathToolsTest__QuadraticIrrational__
#define __MathToolsTest__QuadraticIrrational__

#include <iostream>
#include <string>
#include <sstream>
#include <math.h>
#include "RationalNumber.h"
using namespace std;

class QuadraticIrrational {

public:
    RationalNumber coefficient;
    RationalNumber radicand;
    RationalNumber ratio;
    
    QuadraticIrrational ();
    QuadraticIrrational (RationalNumber c, RationalNumber rad, RationalNumber rat);
    ~QuadraticIrrational () {};
    
    //Calculate Methods
    QuadraticIrrational add (RationalNumber f);
    QuadraticIrrational subtract (RationalNumber f);
    QuadraticIrrational multiply (RationalNumber f);
    QuadraticIrrational divide (RationalNumber f);
    QuadraticIrrational changeSign ();
    
    //Calculate Operators
    QuadraticIrrational operator = (const RationalNumber& frac);
    QuadraticIrrational operator = (const double lf);
    QuadraticIrrational operator + (const RationalNumber& frac);
    QuadraticIrrational operator + (const double lf);
    QuadraticIrrational operator += (const RationalNumber& frac);
    QuadraticIrrational operator += (const double lf);
    QuadraticIrrational operator - (const RationalNumber& frac);
    QuadraticIrrational operator - (const double lf);
    QuadraticIrrational operator -= (const RationalNumber& frac);
    QuadraticIrrational operator -= (const double lf);
    QuadraticIrrational operator * (const RationalNumber& frac);
    QuadraticIrrational operator * (const double lf);
    QuadraticIrrational operator *= (const RationalNumber& frac);
    QuadraticIrrational operator *= (const double lf);
    QuadraticIrrational operator / (const RationalNumber& frac);
    QuadraticIrrational operator / (const double lf);
    QuadraticIrrational operator /= (const RationalNumber& frac);
    QuadraticIrrational operator /= (const double lf);
    
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
    
    //Transform Methods
    void simplify ();
    
    //Set and Get Methods
    double doubleValue () const;
    string stringValue () const;
};

QuadraticIrrational sqrt (RationalNumber& frac);

#endif /* defined(__MathToolsTest__QuadraticIrrational__) */
