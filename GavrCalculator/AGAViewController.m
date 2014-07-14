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

#warning operationButtonsEnabler - не лучшее название для массива, лучше operationButtonsArray
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *operationButtonsEnabler;
@property (weak, nonatomic) IBOutlet UIButton *solveButton;
@property (strong, nonatomic) NSString * fullOperand;

#warning Название fullResult сбивает с толку, будто это строка в результатом, по факту это ведь форматтер
@property (strong, nonatomic) AGAResultFormatter * fullResult;

#warning Лучше operandButtonsArray
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *operandButtonsEnabler;

@end

@implementation AGAViewController

#warning Нbжний ряд кнопок не виден на симуляторе 3.5", надо поправить layout

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _solver = [[AGAModelCalculator alloc]init];
   _fullResult = [[AGAResultFormatter alloc] init];
    
#warning Следующие три строки кода я бы вынес в отдельный метод вроде - (void)setOperationButtonsEnabled:(BOOL)enabled , потому что эти строки дублируются в нескольких местах
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
    _solver = [[AGAModelCalculator alloc]init];
    
    for (UIButton * operationButton in self.operationButtonsEnabler) {
        operationButton.enabled = NO;
    }
    self.solveButton.enabled = NO;
    operationFlag = NO;
    stillTypingOperandFlag = NO;
    
#warning Две следующие строки также лучше оформить отдельным методом, чтобы избежать дублирования
    for (UIButton * operandButton in self.operandButtonsEnabler) {
        operandButton.enabled = YES;
    }
}

- (IBAction)operandTouched:(UIButton*)sender {
#warning Логику ввода операндов и операции лучше вынести в модель либо добавить еще отдельный объект-контроллер
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
    for (UIButton * operandButton in self.operandButtonsEnabler) {
        operandButton.enabled = NO;
    }
}

- (IBAction)signChangeTouched:(id)sender {
    
    self.fullOperand = [self.solver signChange:self.fullOperand];
    
    if (self.fullOperand) {
        stillTypingOperandFlag = YES;
        if ([self.outputLabel.text isEqualToString:@"0"]) {
            self.outputLabel.text = [self.fullOperand stringByAppendingString:@"0"];
        } else { self.outputLabel.text = self.fullOperand; }
        
    } else {
        stillTypingOperandFlag = NO;
        self.outputLabel.text = @"0";
    }
    
}

@end
