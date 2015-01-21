//
//  EventDetailViewController.h
//  Eventik
//
//  Created by Abner Abbey on 15/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>

#import "BuyTicketViewController.h"

@interface EventDetailViewController : UIViewController <MKMapViewDelegate, SelectTicketsDelegate>

//Interface properties
@property (weak, nonatomic) IBOutlet UIImageView *imageEventView;
@property (weak, nonatomic) IBOutlet UIImageView *imageEvent;
@property (weak, nonatomic) IBOutlet MKMapView *mapViewEvent;
@property (weak, nonatomic) IBOutlet UIButton *buttonBuy;


- (IBAction)buyTickets:(UIButton *)sender;
@property (nonatomic, strong)PFObject *detailEvent;

@end
