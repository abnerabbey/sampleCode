//
//  BuyTicketViewController.m
//  Eventik
//
//  Created by Abner Castro Aguilar on 19/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "BuyTicketViewController.h"

@interface BuyTicketViewController ()
{
    NSMutableArray *provisionalTickets;
}

@end

@implementation BuyTicketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self numberTickets] setDelegate:self];
    [[self numberTickets] setDataSource:self];
    
    //tickets data comes from the web service
    /***********************Provisional array to fake the picker*****************************/
    provisionalTickets = [[NSMutableArray alloc] initWithCapacity:10];
    for(int i = 0; i < 10; i++)
    {
        [provisionalTickets addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    NSLog(@"texto: %@", self.texto);
}

- (void)viewWillDisappear:(BOOL)animated
{
    
}

#pragma mark Picker View Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [provisionalTickets count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [provisionalTickets objectAtIndex:row];
}


- (IBAction)cancelBuy:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buyTickets:(UIButton *)sender
{
    [[self delegate] didUserSelectTickets];
    [self dismissViewControllerAnimated:YES completion:nil];
}
















































@end
