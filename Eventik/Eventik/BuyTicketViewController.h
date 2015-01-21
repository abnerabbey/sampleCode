//
//  BuyTicketViewController.h
//  Eventik
//
//  Created by Abner Castro Aguilar on 19/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTicketsDelegate <NSObject>

- (void)didUserSelectTickets;

@end

@interface BuyTicketViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *numberTickets;
- (IBAction)cancelBuy:(UIBarButtonItem *)sender;
- (IBAction)buyTickets:(UIButton *)sender;

@property (nonatomic, strong)NSString *texto;

@property (retain)id <SelectTicketsDelegate> delegate;

@end
