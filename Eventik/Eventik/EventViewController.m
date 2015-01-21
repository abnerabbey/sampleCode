//
//  EventViewController.m
//  Eventik
//
//  Created by Abner Abbey on 14/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "EventViewController.h"
#import "EventDetailViewController.h"

@interface EventViewController ()
{
    NSArray *eventsArray;
}

@end

@implementation EventViewController

#pragma mark View Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Inits objects and sets delegates
    [[self tableEvents] setDelegate:self];
    [[self tableEvents] setDataSource:self];
    
    //Query events from parse asynchronously in order to show them in the TableView
    [self queryEventsFromParse];
}

#pragma mark Table View Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [eventsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventsViewCell *eventCell = [tableView dequeueReusableCellWithIdentifier:@"reuseEvent" forIndexPath:indexPath];
    PFObject *parseObject = [eventsArray objectAtIndex:[indexPath row]];
    eventCell.labelNameEvent.text = [parseObject objectForKey:@"name"];
    eventCell.labelArtist.text = [parseObject objectForKey:@"artist"];
    eventCell.labelVenueEvent.text = [parseObject objectForKey:@"venue"];
    //transforms date from Parse, from NSDate into NSString so it can be displayed in the label
    eventCell.labelDateEvent.text = [self convertNSDateToNSString:[parseObject objectForKey:@"date"]];
    return eventCell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark Helper Methods
- (void)queryEventsFromParse
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.center = self.view.center;
    indicator.hidden = NO;
    indicator.color = [UIColor colorWithRed:0.741 green:0.765 blue:0.78 alpha:1]; /*#bdc3c7*/ //Provisional
    [indicator startAnimating];
    [[self view] addSubview:indicator];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            eventsArray = [[NSArray alloc] initWithArray:objects];
            [[self tableEvents] reloadData];
            [indicator stopAnimating];
            [indicator setHidden:YES];
            [indicator removeFromSuperview];
        }
        else
        {
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Ups!" message:@"Hubo un error al descargar los datos de los eventos" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *tryAgainAction = [UIAlertAction actionWithTitle:@"Intentar de nuevo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self queryEventsFromParse];
                [indicator stopAnimating];
                [indicator removeFromSuperview];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [indicator stopAnimating];
                [indicator setHidden:YES];
                [indicator removeFromSuperview];
            }];
            [errorAlert addAction:tryAgainAction];
            [errorAlert addAction:cancelAction];
            [self presentViewController:errorAlert animated:YES completion:nil];
        }
    }];
}

- (NSString *)convertNSDateToNSString:(NSDate *)date //short form
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    NSString *stringDate = [formatter stringFromDate:date];
    return stringDate;
}

#pragma mark IBActions
- (IBAction)refreshEvents:(UIBarButtonItem *)sender
{
    [self queryEventsFromParse];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"infoEvent"])
    {
        EventDetailViewController *view = [segue destinationViewController];
        NSIndexPath *path = [[self tableEvents] indexPathForSelectedRow];
        PFObject *objectToPass = [eventsArray objectAtIndex:path.row];
        view.detailEvent = objectToPass;
    }
}





































@end
