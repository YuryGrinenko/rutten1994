//
//  AGAModelCalculator.m
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 09.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import "AGAModelCalculator.h"

@implementation AGAModelCalculator

- (NSString *) doOperation {
    
    if ([self.operation isEqualToString:@"+"]){
        rezultOperand = self.firstOperand.doubleValue + self.secondOperand.doubleValue;
    } else if ([self.operation isEqualToString:@"-"]) {
        rezultOperand = self.firstOperand.doubleValue - self.secondOperand.doubleValue;
    } else if ([self.operation isEqualToString:@"x"]) {
        rezultOperand = self.firstOperand.doubleValue * self.secondOperand.doubleValue;
    } else if ([self.operation isEqualToString:@":"]) {
        rezultOperand = self.firstOperand.doubleValue / self.secondOperand.doubleValue;
    }
    return ([NSString stringWithFormat:@"%f", rezultOperand]);
}

- (void) setOperand: (NSString *)operand {
    if (self.operation) {
        self.firstOperand = operand;
    } else {
        self.secondOperand = operand;
    }
}



@end
