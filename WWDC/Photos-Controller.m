//
//  Photos-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Photos-Controller.h"
#import "Photo-View-Controller.h"
#import "ViewController.h"

@interface PC ()

@end

@implementation PC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PVC *destinationViewController = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"firstPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Waiting for Tech Talks.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Waiting for Tech Talks"];
    }
    else if ([segue.identifier isEqualToString:@"secondPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Tech Talks.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Tech Talks"];
    }
    else if ([segue.identifier isEqualToString:@"thirdPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"At Tech Talks.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"At the Tech Talks"];
    }
    else if ([segue.identifier isEqualToString:@"fourthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Tech Talks Venue.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Tech Talks Venue"];
    }
    else if ([segue.identifier isEqualToString:@"fifthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Plane Waiting.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Waiting to Board the Plane to WWDC"];
    }
    else if ([segue.identifier isEqualToString:@"sixthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Apple at Moscone.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Apple at Moscone Center"];
    }
    else if ([segue.identifier isEqualToString:@"seventhPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Me at Moscone.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Me at Moscone Center"];
    }
    else if ([segue.identifier isEqualToString:@"eighthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"In Line for Jacket.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"In Line for Check-In"];
    }
    else if ([segue.identifier isEqualToString:@"ninthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Smiling with Jacket.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Smiling with Jacket"];
    }
    else if ([segue.identifier isEqualToString:@"tenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Smiling with Jacket (#2).jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Smiling with Jacket"];
    }
    else if ([segue.identifier isEqualToString:@"eleventhPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"In Front of OS X Sign.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"OS X 10.10"];
    }
    else if ([segue.identifier isEqualToString:@"twelfthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"'14 Logo.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"My Age & The Year!"];
    }
    else if ([segue.identifier isEqualToString:@"thirteenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Waiting in Line.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Waiting at 2 A.M."];
    }
    else if ([segue.identifier isEqualToString:@"fourteenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Will Code for Food.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"'Will Code for Food!'"];
    }
    else if ([segue.identifier isEqualToString:@"fifteenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"The Crew.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Good Friends in Line"];
    }
    else if ([segue.identifier isEqualToString:@"sixteenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Me in Front.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Second-Row Seats!"];
    }
    else if ([segue.identifier isEqualToString:@"seventeenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"1 Infinite Loop.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"1 Infinite Loop"];
    }
    else if ([segue.identifier isEqualToString:@"eighteenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Chris Espinosa.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Chris Espinosa"];
    }
    else if ([segue.identifier isEqualToString:@"ninteenthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Shaan Pruden.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Shaan Pruden"];
    }
    else if ([segue.identifier isEqualToString:@"twentiethPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Craig Federighi.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Craig Federighi"];
    }
    else if ([segue.identifier isEqualToString:@"twentyFirstPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Jony Ive.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Jony Ive"];
    }
    else if ([segue.identifier isEqualToString:@"twentySecondPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Ari & I.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Ari Weinstein & I"];
    }
    else if ([segue.identifier isEqualToString:@"twentyThirdPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"Call from Apple.jpg"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"Call Telling Us We're In"];
    }
    else if ([segue.identifier isEqualToString:@"twentyFourthPicSegue"])
    {
        [[destinationViewController.childViewControllers firstObject] setImageString:@"W.W.D.C. 2000.png"];
        [[destinationViewController.childViewControllers firstObject] setNavigationBarTitle:@"I'm Only Slightly Older than this Bag"];
    }
}

@end
