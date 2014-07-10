//
//  AGAViewController.m
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 09.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import "AGAViewController.h"
#import "AGAModelCalculator.h"

@interface AGAViewController (){
    BOOL operationFlag;
}

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic, strong) AGAModelCalculator* solver;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *operationButtonsEnabler;
@property (weak, nonatomic) IBOutlet UIButton *solveButton;

@end

@implementation AGAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _solver = [[AGAModelCalculator alloc]init];
    
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        operationButton.enabled = NO;
    }
    self.solveButton.enabled = NO;
    operationFlag = NO;
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
}

- (IBAction)operandTouched:(UIButton*)sender {
    [self.solver setOperand:sender.titleLabel.text];
    self.outputLabel.text = sender.titleLabel.text;
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        if (operationFlag) {
            operationButton.enabled = NO;
        } else {
            operationButton.enabled = YES;
        }
        
        if (operationFlag) {
            self.solveButton.enabled = YES;
        }
        //operationFlag = NO;
    }
}

- (IBAction)operationTouched:(UIButton *)sender {
    operationFlag = YES;
    [self.solver setOperation:sender.titleLabel.text];
    self.outputLabel.text = sender.titleLabel.text;
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        operationButton.enabled = NO;
    }
}

- (IBAction)solveTouched:(id)sender {
    
    self.outputLabel.text = [self.solver doOperation];
    self.solveButton.enabled = NO;
}


@end
