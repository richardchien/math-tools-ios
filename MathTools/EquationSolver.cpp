//
//  CEquationSolver.c
//  EquationSolver
//
//  Created by Richard Chien on 13-5-12.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#include <stdio.h>
#include <math.h>
#include "EquationSolver.h"

//  Equation
//  These functions here will ignore some special situation like "a = 0"
LineEquaRt solveLinearEquation (RationalNumber a, RationalNumber b, RationalNumber c)
{
    LineEquaRt result;
    
    result.x = (c - b) / a;
    
    return result;
}

QuadEquaRt solveQuadraticEquation (RationalNumber a, RationalNumber b, RationalNumber c)
{
    QuadEquaRt result;
    RationalNumber delta, p;
    QuadraticIrrational q;
    
    //According to the mathematical formula
    delta = b * b - a * c * 4;
    if ( delta >= 0 ) {
        p = b.changeSign() / (a * 2);
        q = sqrt(delta) / (a * 2);
        
        result.x1 = q.changeSign() + p;
        result.x2 = q + p;
    }
    //If delta < 0, the equation has no real roots
    else {
        result.hasRealRoots = false;
    }
    
    return result;
}

CubicEquaRt solveCubicEquation (double a, double b, double c, double d)
{
    CubicEquaRt result;
    
    double A, B, C, delta;
    
    //According to the mathematical formula
    A = b * b - 3 * a * c;
    B = b * c - 9 * a * d;
    C = c * c - 3 * b * d;
    delta = B * B - 4 * A * C;
    
    //Situation I
    if ( A == B && B == 0 ) {
        ComplexNumber x;
        x.real = -c / b;
        x.imaginary = 0;
        result.x1 = result.x2 = result.x3 = x;
    }
    //Situation II
    else if ( delta > 0 ) {
        double Y1, Y2;
        Y1 = A * b + 1.5 * a * (-B + sqrt(delta));
        Y2 = A * b + 1.5 * a * (-B - sqrt(delta));
        
        ComplexNumber x1, x2, x3;
        x1.real = (-b - (cbrt(Y1) + cbrt(Y2))) / (3 * a);
        x1.imaginary = 0;
        x2.real = x3.real = (-b + 0.5 * (cbrt(Y1) + cbrt(Y2))) / (3 * a);
        x2.imaginary = ((sqrt(3) / 2) * (cbrt(Y1) - cbrt(Y2))) / (3 * a);
        x3.imaginary = (-(sqrt(3) / 2) * (cbrt(Y1) - cbrt(Y2))) / (3 * a);
        result.x1 = x1;
        result.x2 = x2;
        result.x3 = x3;
    }
    //Situation III
    else if ( delta == 0 ) {
        double K;
        K = B / A;
        
        ComplexNumber x1, x23;
        x1.real = -b / a + K;
        x1.imaginary = 0;
        x23.real = -K / 2;
        x23.imaginary = 0;
        result.x1 = x1;
        result.x2 = result.x3 = x23;
    }
    //Situation IV
    //delta < 0
    else {
        double T, thita;
        T = (2 * A * b - 3 * a * B) / (2 * sqrt(pow(A, 3)));
        thita = acos(T);
        
        ComplexNumber x1, x2, x3;
        x1.real = (-b - 2 * sqrt(A) * cos(thita / 3)) / (3 * a);
        x1.imaginary = 0;
        x2.real = (-b + sqrt(A) * (cos(thita / 3) + sqrt(3) * sin(thita / 3))) / (3 * a);
        x2.imaginary = 0;
        x3.real = (-b + sqrt(A) * (cos(thita / 3) - sqrt(3) * sin(thita / 3))) / (3 * a);
        x3.imaginary = 0;
        result.x1 = x1;
        result.x2 = x2;
        result.x3 = x3;
    }
    
    return result;
}

TwoUnknEquaRt solveTwoUnknownsEquation (RationalNumber a1, RationalNumber b1, RationalNumber c1, RationalNumber a2, RationalNumber b2, RationalNumber c2)
{
    TwoUnknEquaRt result;
    
    //Cramer's Law
    RationalNumber det, detx, dety;
    det = a1 * b2 - a2 * b1;
    detx = c1 * b2 - c2 * b1;
    dety = a1 * c2 - a2 * c1;
    
    result.x = detx / det;
    result.y = dety / det;
    
    return result;
}

ThreeUnknEquaRt solveThreeUnknownsEquation (RationalNumber a1, RationalNumber b1, RationalNumber c1, RationalNumber d1, RationalNumber a2, RationalNumber b2, RationalNumber c2, RationalNumber d2, RationalNumber a3, RationalNumber b3, RationalNumber c3, RationalNumber d3)
{
    ThreeUnknEquaRt result;
    
    //Cramer's Law
    RationalNumber det, detx, dety, detz;
    det = a1 * (b2 * c3 - b3 * c2) + a2 * (b3 * c1 - b1 * c3) + a3 * (b1 * c2 - b2 * c1);
    detx = d1 * (b2 * c3 - b3 * c2) + d2 * (b3 * c1 - b1 * c3) + d3 * (b1 * c2 - b2 * c1);
    dety = a1 * (d2 * c3 - d3 * c2) + a2 * (d3 * c1 - d1 * c3) + a3 * (d1 * c2 - d2 * c1);
    detz = a1 * (b2 * d3 - b3 * d2) + a2 * (b3 * d1 - b1 * d3) + a3 * (b1 * d2 - b2 * d1);
    
    result.x = detx / det;
    result.y = dety / det;
    result.z = detz / det;
    
    return result;
}
