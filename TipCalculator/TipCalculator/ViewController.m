//
//  ViewController.m
//  TipCalculator
//
//  Created by Carl Udren on 1/22/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (assign, nonatomic) float billAmountFloat;
@property (weak, nonatomic) IBOutlet UILabel *TipAmount;
@property (weak, nonatomic) IBOutlet UILabel *TipPercent;
@property (weak, nonatomic) IBOutlet UISlider *percentSlider;
@property (assign, nonatomic) NSInteger tipPercentInt;
@property (assign, nonatomic) float tipAmountFloat;


- (IBAction)sliderDidChange:(UISlider *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.billAmount becomeFirstResponder];
    self.TipAmount.text = @"$0.00";
    self.tipPercentInt = self.percentSlider.value;
    NSString *someString = [NSString stringWithFormat:@"%ld %%", (long)self.tipPercentInt];
    self.TipPercent.text = someString;
    self.billAmount.clearsOnInsertion = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextLabelsWithText) name:UITextFieldTextDidChangeNotification object:nil];
}


- (void) textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"editing");
    NSString *someString = [NSString stringWithFormat:@"%ld %%", (long)self.tipPercentInt];
    self.TipPercent.text = someString;
    self.billAmountFloat = [textField.text floatValue];
    float tip = self.billAmountFloat * ((float)self.tipPercentInt/100);
    NSString *someString2 = [NSString stringWithFormat:@"$%1.2f", tip];
    self.TipAmount.text = someString2;
}
- (void) textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"editing");
    NSString *someString = [NSString stringWithFormat:@"%ld %%", (long)self.tipPercentInt];
    self.TipPercent.text = someString;
    self.billAmountFloat = [textField.text floatValue];
    float tip = self.billAmountFloat * ((float)self.tipPercentInt/100);
    NSString *someString2 = [NSString stringWithFormat:@"$%1.2f", tip];
    self.TipAmount.text = someString2;
}

- (IBAction)sliderDidChange:(UISlider *)sender {
    self.tipPercentInt = sender.value;
    NSLog(@"%d", (int)self.tipPercentInt);
    NSString *someString = [NSString stringWithFormat:@"%d %%", (int)sender.value];
    self.TipPercent.text = someString;
    self.billAmountFloat = [self.billAmount.text floatValue];
    float tip = self.billAmountFloat * ((float)self.tipPercentInt/100);
    NSLog(@"%f", tip);
    NSString *someString2 = [NSString stringWithFormat:@"$%1.2f", tip];
    self.TipAmount.text = someString2;
}


-(void)updateTextLabelsWithText{
    NSLog(@"editing");
    self.billAmountFloat = [self.billAmount.text floatValue];
    float tip = self.billAmountFloat * ((float)self.tipPercentInt/100);
    NSString *someString2 = [NSString stringWithFormat:@"$%1.2f", tip];
    self.TipAmount.text = someString2;

}


@end
