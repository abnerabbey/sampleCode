//
//  EventViewController.h
//  Eventik
//
//  Created by Abner Abbey on 14/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "EventsViewCell.h"

@interface EventViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableEvents;
- (IBAction)refreshEvents:(UIBarButtonItem *)sender;
@end
