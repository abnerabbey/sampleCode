//
//  SettingsViewController.m
//  Eventik
//
//  Created by Abner Castro Aguilar on 19/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
{
    NSArray *arrayMenu;
}

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrayMenu = [[NSArray alloc] initWithObjects:@"Ajustes",@"Información",@"Ayuda",@"Tarjetas",@"Tickets",@"Spread Love", nil];
    [[self tableSettings] setDelegate:self];
    [[self tableSettings] setDataSource:self];
}

#pragma mark Table View Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayMenu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    cell.textLabel.text = [arrayMenu objectAtIndex:[indexPath row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showSettingAtIndex:[indexPath row]];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark Helper Methods
- (void)showSettingAtIndex:(NSInteger)index
{
    switch(index)
    {
        case 0:
            break;
        case 1:
            [self performSegueWithIdentifier:@"info" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"ayuda" sender:self];
            break;
        case 5:
        {
            UIAlertController *loveSheet = [UIAlertController alertControllerWithTitle:@"Spread Love" message:@"Share this app whit your firends!" preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                SLComposeViewController *facebookController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                [facebookController setInitialText:@"Prueba Eventik! Con esta app podrás comprar boletos de tus eventos favoritos desde tu smartphone.\nhttp://www.tickethub.mx"];
                [self presentViewController:facebookController animated:YES completion:nil];
            }];
            UIAlertAction *twitterAction = [UIAlertAction actionWithTitle:@"Twitter" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                SLComposeViewController *twitterController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                [twitterController setInitialText:@"Prueba Eventik! Podrás comprar boletos desde tu smartphone de manera rápida y fácil\nhttp://www.tickethub.mx"];
                [self presentViewController:twitterController animated:YES completion:nil];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            [loveSheet addAction:facebookAction];
            [loveSheet addAction:twitterAction];
            [loveSheet addAction:cancelAction];
            [self presentViewController:loveSheet animated:YES completion:nil];
        }
        break;
        default:
            break;
    }
}













































































@end
