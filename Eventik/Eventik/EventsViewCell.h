//
//  EventsViewCell.h
//  Eventik
//
//  Created by Abner Abbey on 14/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelNameEvent;
@property (weak, nonatomic) IBOutlet UILabel *labelArtist;
@property (weak, nonatomic) IBOutlet UILabel *labelVenueEvent;
@property (weak, nonatomic) IBOutlet UILabel *labelDateEvent;
@end
