//
//  SettingsViewController.h
//  Eventik
//
//  Created by Abner Castro Aguilar on 19/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableSettings;
@end
