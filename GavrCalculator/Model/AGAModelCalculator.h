//
//  AGAModelCalculator.h
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 09.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGAModelCalculator : NSObject{
    double rezultOperand;
}

@property (nonatomic, strong) NSString * firstOperand;
@property (nonatomic, strong) NSString * secondOperand;
@property (nonatomic, strong) NSString * operation;
//@property (nonatomic, strong) NSString * rezultOperand;


//- (void) setOperand: (NSString *) operand;
- (double) doOperation;
- (void) setOperand: (NSString *)operand;
- (NSString *) signChange: (NSString *) operand;




@end
