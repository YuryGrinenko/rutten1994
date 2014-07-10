//
//  AGAViewController.m
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 09.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import "AGAViewController.h"
#import "AGAModelCalculator.h"

@interface AGAViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic, strong) AGAModelCalculator* solver;

@end

@implementation AGAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _solver = [[AGAModelCalculator alloc]init];
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

}
- (IBAction)operandTouched:(UIButton*)sender {
    //
    [self.solver setOperand:sender.titleLabel.text];
}

- (IBAction)operationTouched:(UIButton *)sender {
    [self.solver setOperation:sender.titleLabel.text];
}

- (IBAction)solveTouched:(id)sender {
    
    self.outputLabel.text = [self.solver doOperation];
}


@end
