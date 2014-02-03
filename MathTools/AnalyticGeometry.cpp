//
//  AnalyticGeometry.cpp
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#include <math.h>
#include "AnalyticGeometry.h"
#include "EquationSolver.h"

Line LineWithTwoPoint(RCPoint M, RCPoint N)
{
    Line result;
    
    //Formula is abtained from y-y0=k(x-x0)
    result.A = M.y - N.y;
    result.B = N.x - M.x;
    result.C = M.y * (M.x - N.x) - M.x * (M.y - N.y);
    
    return result;
}

QuadraticIrrational distanceBetweenPointAndLine (RCPoint P, Line L)
{
    QuadraticIrrational result;
    
    //Formula: d = |Ax0+By0+C| * √(1/(A^2+B^2))
    RationalNumber num1 = L.A * P.x + L.B * P.y + L.C;
    num1 = num1 > 0 ? num1 : num1.changeSign();
    RationalNumber num2UnderRoot = (L.A.xSquared() + L.B.xSquared()).invert();
    QuadraticIrrational num2 = sqrt(num2UnderRoot);
    result = num2 * num1;
    
    return result;
}

bool pointIsOnLine (RCPoint P, Line L)
{
    if (L.A * P.x + L.B * P.y + L.C == 0)
        return true;
    else
        return false;
}

Circle circleWithThreePoint (RCPoint P, RCPoint Q, RCPoint M)
{
    Circle result;
    
    ThreeUnknEquaRt root = solveThreeUnknownsEquation(P.x, P.y, frac(1), (P.x.xSquared() + P.y.xSquared()).changeSign(),
                                                      Q.x, Q.y, frac(1), (Q.x.xSquared() + Q.y.xSquared()).changeSign(),
                                                      M.x, M.y, frac(1), (M.x.xSquared() + M.y.xSquared()).changeSign());
    result.D = root.x;
    result.E = root.y;
    result.F = root.z;
    
    return result;
}

Ellipse ellipseWithThoPoint (RCPoint P, RCPoint Q)
{
    Ellipse result;
    
    TwoUnknEquaRt root = solveTwoUnknownsEquation(P.x.xSquared(), P.y.xSquared(), frac(1),
                                                  Q.x.xSquared(), Q.y.xSquared(), frac(1));
    result.m = root.x;
    result.n = root.y;
    
    return result;
}
