//
//  AGAModelCalculator.m
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 09.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import "AGAModelCalculator.h"

@implementation AGAModelCalculator

- (double) doOperation {
#warning Строковые константы операций лучше вынести в перечисление (enum)
    if ([self.operation isEqualToString:@"+"]){
#warning rezult с ошибкой
        rezultOperand = self.firstOperand.doubleValue + self.secondOperand.doubleValue;
        
    } else if ([self.operation isEqualToString:@"-"]) {
        
        rezultOperand = self.firstOperand.doubleValue - self.secondOperand.doubleValue;
        
    } else if ([self.operation isEqualToString:@"x"]) {
        
        rezultOperand = self.firstOperand.doubleValue * self.secondOperand.doubleValue;
        
    } else if ([self.operation isEqualToString:@":"]) {
        
        rezultOperand = self.firstOperand.doubleValue / self.secondOperand.doubleValue;
    }
    return rezultOperand;
}

- (void) setOperand: (NSString *)operand {
    
    if (!self.operation) {
        
        self.firstOperand = operand;
        
    } else {
        
        self.secondOperand = operand;
        
    }
}

#warning Имя метода ничего не говорит о типе возвращаемого результата и о принимаемом параметре
- (NSString *) signChange: (NSString *) operand {
    
    double changedOperand;
    if (!self.operation) {
        
        if ([self.firstOperand isEqualToString:@"-"]) {
            
            self.firstOperand = nil;
            
        } else if (self.firstOperand) {
            
            changedOperand = (-1) * self.firstOperand.doubleValue;
            self.firstOperand = [NSString stringWithFormat:@"%g",changedOperand];
            
        } else if (!self.firstOperand) {
            self.firstOperand = @"-";
        }
        return self.firstOperand;
    } else {
        
        if ([self.secondOperand isEqualToString:@"-"]) {
            
            self.secondOperand = nil;
            
        } else if (self.secondOperand) {
            
            changedOperand = (-1) * self.secondOperand.doubleValue;
            self.secondOperand = [NSString stringWithFormat:@"%g",changedOperand];
            
        } else if (!self.secondOperand) {
            self.secondOperand = @"-";
        }
        return self.secondOperand;
        
    }
    
}



@end
