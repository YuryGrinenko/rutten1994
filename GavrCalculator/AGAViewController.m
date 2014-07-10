//
//  AGAViewController.m
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 09.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import "AGAViewController.h"
#import "AGAModelCalculator.h"
#import "AGAResultFormatter.h"

@interface AGAViewController (){
    BOOL operationFlag;
    BOOL stillTypingOperandFlag;
}

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic, strong) AGAModelCalculator* solver;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *operationButtonsEnabler;
@property (weak, nonatomic) IBOutlet UIButton *solveButton;
@property (strong, nonatomic) NSString * fullOperand;
@property (strong, nonatomic) AGAResultFormatter * fullResult;

@end

@implementation AGAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _solver = [[AGAModelCalculator alloc]init];
   _fullResult = [[AGAResultFormatter alloc] init];
    
    
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        operationButton.enabled = NO;
    }
    self.solveButton.enabled = NO;
    operationFlag = NO;
    stillTypingOperandFlag = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doCancel:(id)sender {
    self.solver = nil;
    self.outputLabel.text = @"0";
    _solver = [[AGAModelCalculator alloc]init];//////////// Note: Сделать Lazy init
    
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        operationButton.enabled = NO;
    }
    self.solveButton.enabled = NO;
    operationFlag = NO;
    stillTypingOperandFlag = NO;
}

- (IBAction)operandTouched:(UIButton*)sender {
    
    if (stillTypingOperandFlag) {
        self.fullOperand = [self.fullOperand stringByAppendingString:sender.titleLabel.text];
        [self.solver setOperand:self.fullOperand];
        self.outputLabel.text = self.fullOperand;
    } else {
        self.fullOperand = sender.titleLabel.text;
        [self.solver setOperand:self.fullOperand];
        self.outputLabel.text = self.fullOperand;
    }
    
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        if (operationFlag) {
            operationButton.enabled = NO;
        } else {
            operationButton.enabled = YES;
        }
        
        if (operationFlag) {
            self.solveButton.enabled = YES;
        }
    }
    stillTypingOperandFlag = YES;
}

- (IBAction)operationTouched:(UIButton *)sender {
    
    operationFlag = YES;
    stillTypingOperandFlag = NO;
    [self.solver setOperation:sender.titleLabel.text];
    self.outputLabel.text = sender.titleLabel.text;
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        operationButton.enabled = NO;
    }
}

- (IBAction)solveTouched:(id)sender {
    
    
    [self.solver doOperation];
    self.outputLabel.text = [self.fullResult resultInStringForm:self.solver];
    
    self.solveButton.enabled = NO;
}


@end
