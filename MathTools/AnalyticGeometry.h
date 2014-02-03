//
//  AnalyticGeometry.h
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#ifndef __MathTools__AnalyticGeometry__
#define __MathTools__AnalyticGeometry__

#include "Point.h"
#include "RationalNumber.h"
#include "QuadraticIrrational.h"

struct Line {
    //Ax+By+C=0
    RationalNumber A, B, C;
};

struct Circle {
    //x^2+y^2+Dx+Ey+F=0
    RationalNumber D, E, F;
};

struct Ellipse {
    //mx^2+ny^2=1
    RationalNumber m, n;
};

typedef struct Line Line;
typedef struct Circle Circle;
typedef struct Ellipse Ellipse;

Line LineWithTwoPoint (RCPoint M, RCPoint N);
QuadraticIrrational distanceBetweenPointAndLine (RCPoint P, Line L);
bool pointIsOnLine (RCPoint P, Line L);
Circle circleWithThreePoint (RCPoint P, RCPoint Q, RCPoint M);
Ellipse ellipseWithThoPoint (RCPoint P, RCPoint Q);

#endif
