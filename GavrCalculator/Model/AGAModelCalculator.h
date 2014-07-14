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

#warning Лучше не показывать без лишней надобности в *.h read-write property. Такое объявление нужно
#pragma  перенести в *.m, а в *.h оставить @property (nonatomic, strong, readonly)
@property (nonatomic, strong) NSString * firstOperand;
@property (nonatomic, strong) NSString * secondOperand;
@property (nonatomic, strong) NSString * operation;

#warning Закомментированный код нужно удалять. Если он понадобится, его всегда можно найти в истории коммитов
//@property (nonatomic, strong) NSString * rezultOperand;


//- (void) setOperand: (NSString *) operand;
- (double) doOperation;
- (void) setOperand: (NSString *)operand;
- (NSString *) signChange: (NSString *) operand;




@end
