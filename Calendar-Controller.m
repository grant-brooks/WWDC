//
//  Calendar-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Calendar-Controller.h"
#import "ViewController.h"

@interface CC ()

@end

@implementation CC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.calendarToolbar setClipsToBounds:YES];
    [self.secondCalendarToolbar setClipsToBounds:YES];
    [[UIBarButtonItem appearanceWhenContainedIn: [UISearchBar class], nil] setTintColor:[UIColor redColor]];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (IBAction)calendarBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

