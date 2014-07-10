//
//  AGAResultFormatter.m
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 11.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import "AGAResultFormatter.h"
#import "AGAModelCalculator.h"

@implementation AGAResultFormatter

- (NSString *) resultInStringForm:(AGAModelCalculator *) result {
    
    return [NSString stringWithFormat:@"%@ %@ %@ = %g", result.firstOperand, result.operation, result.secondOperand, result.doOperation];
}

@end
