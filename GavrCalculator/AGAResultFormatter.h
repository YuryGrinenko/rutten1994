//
//  AGAResultFormatter.h
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 11.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGAModelCalculator;

@interface AGAResultFormatter : NSObject

#warning Надо изменить имя метода, на что-то вроде formattedResultFromCalculator, с текущим названием неясно, что он делает
- (NSString *) resultInStringForm:(AGAModelCalculator *) result;

@end
