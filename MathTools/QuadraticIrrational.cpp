//
//  QuadraticIrrational.cpp
//  MathToolsTest
//
//  Created by Richard Chien on 13-11-19.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#include "QuadraticIrrational.h"

QuadraticIrrational::QuadraticIrrational ()
{
    coefficient = 1;
    radicand = 0;
    ratio = 0;
}

QuadraticIrrational::QuadraticIrrational (RationalNumber c, RationalNumber rad, RationalNumber rat)
{
    coefficient = c;
    radicand = rad;
    ratio = rat;
}

#pragma mark - Transform Methods

void QuadraticIrrational::simplify ()
{
    coefficient.reduce();
    radicand.reduce();
    ratio.reduce();
    
    //Denominator rationalization
    if (radicand.denominator != 1) {
        coefficient *= RationalNumber(1, radicand.denominator);
        radicand = radicand.numerator * radicand.denominator;
    }
    
    for (int i = (int)sqrt(radicand.doubleValue()); i >= 2; i --) {
        if ((int)radicand.doubleValue() % (i * i) == 0) {
            coefficient *= i;
            radicand /= i * i;
        }
        else
            continue;
    }
    
    if (coefficient == 0) {
        radicand = 0;
        coefficient = 1;
    }
    
    if (radicand == 0)
        coefficient = 1;
    else if (radicand == 1) {
        ratio += coefficient;
        radicand = 0;
        coefficient = 1;
    }
    
    //After being simplified, the coefficient won't be 0, and the radicand won't be 1.
}

QuadraticIrrational sqrt (RationalNumber& frac)
{
    QuadraticIrrational result;
    
    result.radicand = frac;
    
    result.simplify();
    return result;
}

#pragma mark - Calculate Methods

QuadraticIrrational QuadraticIrrational::add (RationalNumber f)
{
    QuadraticIrrational result;
    
    result.coefficient = coefficient;
    result.radicand = radicand;
    result.ratio = ratio + f;
    
    result.simplify();
    return result;
}

QuadraticIrrational QuadraticIrrational::subtract (RationalNumber f)
{
    QuadraticIrrational result;
    
    result.coefficient = coefficient;
    result.radicand = radicand;
    result.ratio = ratio - f;
    
    result.simplify();
    return result;
}

QuadraticIrrational QuadraticIrrational::multiply (RationalNumber f)
{
    QuadraticIrrational result;
    
    result.coefficient = coefficient * f;
    result.radicand = radicand;
    result.ratio = ratio * f;
    
    result.simplify();
    return result;
}

QuadraticIrrational QuadraticIrrational::divide (RationalNumber f)
{
    QuadraticIrrational result;
    
    result.coefficient = coefficient * f.invert();
    result.radicand = radicand;
    result.ratio = ratio * f.invert();
    
    result.simplify();
    return result;
}

QuadraticIrrational QuadraticIrrational::changeSign ()
{
    QuadraticIrrational result;
    
    result.coefficient = coefficient.changeSign();
    result.radicand = radicand;
    result.ratio = ratio.changeSign();
    
    return result;
}

#pragma mark - Calculate Operators

QuadraticIrrational QuadraticIrrational::operator = (const RationalNumber& frac)
{
    QuadraticIrrational result;
    result.ratio = frac;
    *this = result;
    return *this;
}

QuadraticIrrational QuadraticIrrational::operator = (const double lf)
{
    *this = fractionFromDouble(lf);
    return *this;
}

QuadraticIrrational QuadraticIrrational::operator + (const RationalNumber& frac)
{
    return this -> add(frac);
}

QuadraticIrrational QuadraticIrrational:: operator + (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this + frac;
}

QuadraticIrrational QuadraticIrrational::operator += (const RationalNumber& frac)
{
    *this = *this + frac;
    return *this;
}

QuadraticIrrational QuadraticIrrational::operator += (const double lf)
{
    *this = *this + lf;
    return *this;
}

QuadraticIrrational QuadraticIrrational::operator - (const RationalNumber& frac)
{
    return this -> subtract(frac);
}

QuadraticIrrational QuadraticIrrational:: operator - (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this - frac;
}

QuadraticIrrational QuadraticIrrational::operator -= (const RationalNumber& frac)
{
    *this = *this - frac;
    return *this;
}

QuadraticIrrational QuadraticIrrational::operator -= (const double lf)
{
    *this = *this - lf;
    return *this;
}

QuadraticIrrational QuadraticIrrational::operator * (const RationalNumber& frac)
{
    return this -> multiply(frac);
}

QuadraticIrrational QuadraticIrrational:: operator * (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this * frac;
}

QuadraticIrrational QuadraticIrrational::operator *= (const RationalNumber& frac)
{
    *this = *this * frac;
    return *this;
}

QuadraticIrrational QuadraticIrrational:: operator *= (const double lf)
{
    *this = *this * lf;
    return *this;
}

QuadraticIrrational QuadraticIrrational::operator / (const RationalNumber& frac)
{
    return this -> divide(frac);
}

QuadraticIrrational QuadraticIrrational:: operator / (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this / frac;
}

QuadraticIrrational QuadraticIrrational::operator /= (const RationalNumber& frac)
{
    *this = *this / frac;
    return *this;
}

QuadraticIrrational QuadraticIrrational:: operator /= (const double lf)
{
    *this = *this / lf;
    return *this;
}

#pragma mark - Set and Get Methods

double QuadraticIrrational::doubleValue () const
{
    return coefficient.doubleValue() * sqrt(radicand.doubleValue()) + ratio.doubleValue();
}

string QuadraticIrrational::stringValue () const
{
    QuadraticIrrational self = *this;
    self.simplify();
    
    stringstream ss;
    
    if (self.radicand != 0) {
        if (self.coefficient == -1)
            ss << '-';
        else if (self.coefficient != 1)
            ss << self.coefficient.stringValue();
        
        ss << "√" << self.radicand.stringValue();
    }
    
    if (self.ratio != 0) {
        if (self.radicand != 0)
            ss << (self.ratio > 0 ? "+" :"");
        ss << self.ratio.stringValue();
    }
    
    string result = ss.str();
    return result;
}
