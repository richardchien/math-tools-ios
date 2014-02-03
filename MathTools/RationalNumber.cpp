//
//  RationalNumber.cpp
//
//
//  Created by Richard Chien on 13-4-22.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#include "RationalNumber.h"

RationalNumber::RationalNumber ():
numerator(0), denominator(1)
{
}

RationalNumber::RationalNumber (long n, long d):
numerator(n), denominator(d)
{
}

#pragma mark - Transform Methods

//  Determine whether a number is an integer or not
bool isInt(double a)
{
    double dif = fabs(((long)a - a));
    
    if(dif < 0.0000001 || dif > 0.999999)
        return true;
    else
        return false;
}

long commonDivisorOf(long u, long v)
{
    long temp;
    
    while ( v != 0 ) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    return u;
}

long commonMultipleOf(long u, long v)
{
    long commonDiv = commonDivisorOf(u, v);
    
    return (u > v ? u : v) / commonDiv * (u < v ? u : v);
}

RationalNumber fractionFromDouble (double lf)
{
    double nume = lf;
    long deno = 1;
    
    while (!isInt(nume)) {
        nume *= 10;
        deno *= 10;
    }
    
    RationalNumber result((long)nume, deno);
    result.reduce();
    return result;
}

RationalNumber frac (double lf)
{
    return fractionFromDouble(lf);
}

void RationalNumber::reduce ()
{
    long commonDiv = commonDivisorOf(numerator, denominator);
    
    numerator /= commonDiv;
    denominator /= commonDiv;
    
    if (denominator < 0) {
        denominator = -denominator;
        numerator = -numerator;
    }
}

#pragma mark - Caculate Methods

RationalNumber RationalNumber::add (RationalNumber f)
{
    //a/b + c/d = ((a*d) + (b*c)) / (b*d)
    
    this -> reduce();
    f.reduce();
    
    RationalNumber result;
    
    long d = commonMultipleOf(denominator, f.denominator);
    result.denominator = d;
    result.numerator = numerator * (d / denominator) + f.numerator * (d / f.denominator);
    
    result.reduce();
    return result;
}

RationalNumber RationalNumber::subtract (RationalNumber f)
{
    //a/b - c/d = a/b - c/d = a/b + (-c/d)
    
    return this -> add(f.changeSign());
}

RationalNumber RationalNumber::multiply (RationalNumber f)
{
    //a/b * c/d = a*c / b*d
    
    this -> reduce();
    f.reduce();
    
    RationalNumber num1(numerator, f.denominator), num2(f.numerator, denominator);
    num1.reduce();
    num2.reduce();
    
    RationalNumber result;
    
    result.numerator = num1.numerator * num2.numerator;
    result.denominator = num1.denominator * num2.denominator;
    
    result.reduce();
    return result;
}

RationalNumber RationalNumber::divide (RationalNumber f)
{
    //a/b / c/d = a/b * d/c
    
    return this -> multiply(f.invert());
}

RationalNumber RationalNumber::invert ()
{
    RationalNumber result (denominator, numerator);
    result.reduce();
    return result;
}

RationalNumber RationalNumber::changeSign ()
{
    RationalNumber result;
    
    result.numerator = -numerator;
    result.denominator = denominator;
    
    result.reduce();
    return result;
}

RationalNumber RationalNumber::xSquared ()
{
    this -> reduce();
    RationalNumber result (numerator * numerator, denominator * denominator);
    return result;
}

#pragma mark - Caculate Operators

RationalNumber RationalNumber::operator = (const double lf)
{
    *this = fractionFromDouble(lf);
    return *this;
}

RationalNumber RationalNumber::operator + (const RationalNumber& frac)
{
    return this -> add(frac);
}

RationalNumber RationalNumber:: operator + (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this + frac;
}

RationalNumber RationalNumber::operator += (const RationalNumber& frac)
{
    *this = *this + frac;
    return *this;
}

RationalNumber RationalNumber::operator += (const double lf)
{
    *this = *this + lf;
    return *this;
}

RationalNumber RationalNumber::operator - (const RationalNumber& frac)
{
    return this -> subtract(frac);
}

RationalNumber RationalNumber:: operator - (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this - frac;
}

RationalNumber RationalNumber::operator -= (const RationalNumber& frac)
{
    *this = *this - frac;
    return *this;
}

RationalNumber RationalNumber::operator -= (const double lf)
{
    *this = *this - lf;
    return *this;
}

RationalNumber RationalNumber::operator * (const RationalNumber& frac)
{
    return this -> multiply(frac);
}

RationalNumber RationalNumber:: operator * (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this * frac;
}

RationalNumber RationalNumber::operator *= (const RationalNumber& frac)
{
    *this = *this * frac;
    return *this;
}

RationalNumber RationalNumber:: operator *= (const double lf)
{
    *this = *this * lf;
    return *this;
}

RationalNumber RationalNumber::operator / (const RationalNumber& frac)
{
    return this -> divide(frac);
}

RationalNumber RationalNumber:: operator / (const double lf)
{
    RationalNumber frac = fractionFromDouble(lf);
    return *this / frac;
}

RationalNumber RationalNumber::operator /= (const RationalNumber& frac)
{
    *this = *this / frac;
    return *this;
}

RationalNumber RationalNumber:: operator /= (const double lf)
{
    *this = *this / lf;
    return *this;
}

#pragma mark - Compare Operators

bool RationalNumber:: operator == (const RationalNumber &frac)
{
    return (*this - frac).doubleValue() == 0;
}

bool RationalNumber:: operator == (const double lf)
{
    RationalNumber param = fractionFromDouble(lf);
    return *this == param;
}

bool RationalNumber:: operator != (const RationalNumber &frac)
{
    return (*this - frac).doubleValue() != 0;
}

bool RationalNumber:: operator != (const double lf)
{
    RationalNumber param = fractionFromDouble(lf);
    return *this != param;
}

bool RationalNumber:: operator > (const RationalNumber &frac)
{
    return (*this - frac).doubleValue() > 0;
}

bool RationalNumber:: operator > (const double lf)
{
    RationalNumber param = fractionFromDouble(lf);
    return *this > param;
}

bool RationalNumber:: operator >= (const RationalNumber &frac)
{
    return (*this - frac).doubleValue() >= 0;
}

bool RationalNumber:: operator >= (const double lf)
{
    RationalNumber param = fractionFromDouble(lf);
    return *this >= param;
}

bool RationalNumber:: operator < (const RationalNumber &frac)
{
    return (*this - frac).doubleValue() < 0;
}

bool RationalNumber:: operator < (const double lf)
{
    RationalNumber param = fractionFromDouble(lf);
    return *this < param;
}

bool RationalNumber:: operator <= (const RationalNumber &frac)
{
    return (*this - frac).doubleValue() <= 0;
}

bool RationalNumber:: operator <= (const double lf)
{
    RationalNumber param = fractionFromDouble(lf);
    return *this <= param;
}

#pragma mark - Set and Get Methods

void RationalNumber::setFraction (long n, long d)
{
    numerator = n;
    denominator = d;
    this -> reduce();
}

double RationalNumber::doubleValue () const
{
    return (double)numerator / denominator;
}

string RationalNumber::stringValue () const
{
    RationalNumber self = *this;
    self.reduce();
    long n = self.numerator;
    long d = self.denominator;
    
    stringstream ss;
    
    if (d == 1) ss << n;
    else ss << n << '/' << d;
    
    string result = ss.str();
    return result;
}
