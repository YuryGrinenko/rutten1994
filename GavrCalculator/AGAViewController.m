//
//  AGAViewController.m
//  GavrCalculator
//
//  Created by Artyom Gavryushov on 09.07.14.
//  Copyright (c) 2014 Gavr corp. All rights reserved.
//

#import "AGAViewController.h"

@interface AGAViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@end

@implementation AGAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doCancel:(id)sender {
    self.outputLabel.text = @"0";

}

@end
