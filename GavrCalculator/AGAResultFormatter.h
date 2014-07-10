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

- (NSString *) resultInStringForm:(AGAModelCalculator *) result;

@end
