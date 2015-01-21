//
//  EventDetailViewController.m
//  Eventik
//
//  Created by Abner Abbey on 15/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "EventDetailViewController.h"
#import "UIImageEffects.h"
#import "PruebaViewController.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Image from Parse
    UIImage *imageEvent = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.detailEvent objectForKey:@"poster"]]]];
    self.imageEventView.image = [UIImageEffects imageByApplyingLightEffectToImage:imageEvent];
    self.imageEvent.image = imageEvent;
    
    //Inits objects and sets delegates
    self.mapViewEvent.delegate = self;
    
    //Customize button buy
    self.buttonBuy.layer.borderWidth = 1;
    self.buttonBuy.layer.borderColor = [[UIColor colorWithRed:0.741 green:0.765 blue:0.78 alpha:1] CGColor];//Provisional
    self.buttonBuy.layer.cornerRadius = 5;
    
    //************* Provisional bar button **************//
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Más" style:UIBarButtonItemStylePlain target:self action:@selector(presentMoreOptions)];
    self.navigationItem.rightBarButtonItem = infoButton;
}

#pragma mark MapView Delegate
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    //******************** Provisional location ************************//
    [self performSelector:@selector(addLocation) withObject:nil afterDelay:1.0];
}

#pragma mark Helper Methods
- (void)addLocation
{
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 19.424349;
    coordinate.longitude = -99.194939;
    annotation.coordinate = coordinate;
    annotation.title = @"Tu evento";
    [self.mapViewEvent addAnnotation:annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 700, 700);
    [[self mapViewEvent] setRegion:region animated:YES];
}

- (void)presentMoreOptions
{
    UIAlertController *optionsController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *calendarAction = [UIAlertAction actionWithTitle:@"Add to Calendar" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *infoAction = [UIAlertAction actionWithTitle:@"Info" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *twitterAction = [UIAlertAction actionWithTitle:@"Twitter" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];
    [optionsController addAction:calendarAction];
    [optionsController addAction:infoAction];
    [optionsController addAction:facebookAction];
    [optionsController addAction:twitterAction];
    [optionsController addAction:cancelAction];
    [self presentViewController:optionsController animated:YES completion:nil];
}

//MODAL VIEW DELEGATE
- (void)didUserSelectTickets
{
    NSLog(@"Selected!!");
}

#pragma mark IBActions
- (IBAction)buyTickets:(UIButton *)sender
{
    //Verify the user's log
    /****************************Once the user has logged in, the next view is available!!**********************************/
    //[self performSegueWithIdentifier:@"canBuy" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"canBuy"])
    {
        BuyTicketViewController *buyView = [segue destinationViewController];
        buyView.texto = @"texto en Vista (=";
    }
}




























@end
