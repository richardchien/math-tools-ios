//
//  CEquationSolver.h
//  EquationSolver
//
//  Created by Richard Chien on 13-5-12.
//  Copyright (c) 2013年 Richard Chien. All rights reserved.
//

#ifndef EquationSolver_CEquationSolver_h
#define EquationSolver_CEquationSolver_h

//  Include ComplexNumber header file
#include "ComplexNumber.h"
#include "QuadraticIrrational.h"

//  Equation
//  Struct declarations
struct LinearEquationRoots {
    RationalNumber x;
};

struct QuadraticEquationRoots {
    QuadraticIrrational x1, x2;
    bool hasRealRoots = true;
};

struct CubicEquationRoots {
    ComplexNumber x1, x2, x3;
};

struct TwoUnknownsEquationRoots {
    RationalNumber x, y;
};

struct ThreeUnknownsEquationRoots {
    RationalNumber x, y, z;
};

//  Define new types
typedef struct LinearEquationRoots LineEquaRt;
typedef struct QuadraticEquationRoots QuadEquaRt;
typedef struct CubicEquationRoots CubicEquaRt;
typedef struct TwoUnknownsEquationRoots TwoUnknEquaRt;
typedef struct ThreeUnknownsEquationRoots ThreeUnknEquaRt;

//  Function declarations, return variables of types defined above
LineEquaRt solveLinearEquation (RationalNumber a, RationalNumber b, RationalNumber c);
QuadEquaRt solveQuadraticEquation (RationalNumber a, RationalNumber b, RationalNumber c);
CubicEquaRt solveCubicEquation (double a, double b, double c, double d);
TwoUnknEquaRt solveTwoUnknownsEquation (RationalNumber a1, RationalNumber b1, RationalNumber c1, RationalNumber a2, RationalNumber b2, RationalNumber c2);
ThreeUnknEquaRt solveThreeUnknownsEquation (RationalNumber a1, RationalNumber b1, RationalNumber c1, RationalNumber d1, RationalNumber a2, RationalNumber b2, RationalNumber c2, RationalNumber d2, RationalNumber a3, RationalNumber b3, RationalNumber c3, RationalNumber d3);

#endif
