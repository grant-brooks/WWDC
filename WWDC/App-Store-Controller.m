//
//  App-Store-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "App-Store-Controller.h"
#import "ViewController.h"
#import "Background-Button.h"

@interface AC ()

@end

@implementation AC

- (void)viewWillAppear:(BOOL)animated
{
    [[self.appStoreTabBar.items objectAtIndex:0] setTitle:NSLocalizedString(@"BotonMapas", @"comment")];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
    
    BB *regButton = [[BB alloc] initWithFrame:CGRectMake(272, 23, 60, 30)];
    regButton.layer.borderWidth = 1.0f;
    regButton.layer.cornerRadius = 5.0f;
    regButton.layer.borderColor = [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    regButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f];
    [regButton setTitle:@"GET" forState:UIControlStateNormal];
    [regButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [regButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [regButton setLinkString:@"https://itunes.apple.com/us/app/trivia-for-grand-theft-auto/id963613295?mt=8"];
    [self.appSpotlightView addSubview:regButton];
    
    BB *regButton2 = [[BB alloc] initWithFrame:CGRectMake(272, 423, 60, 30)];
    regButton2.layer.borderWidth = 1.0f;
    regButton2.layer.cornerRadius = 5.0f;
    regButton2.layer.borderColor = [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    regButton2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f];
    [regButton2 setTitle:@"GET" forState:UIControlStateNormal];
    [regButton2 setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [regButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [regButton2 setLinkString:@"https://itunes.apple.com/us/app/itap-that-button-game/id913372112?mt=8"];
    [self.appSpotlightView addSubview:regButton2];
    
    BB *regButton3 = [[BB alloc] initWithFrame:CGRectMake(272, 833, 60, 30)];
    regButton3.layer.borderWidth = 1.0f;
    regButton3.layer.cornerRadius = 5.0f;
    regButton3.layer.borderColor = [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    regButton3.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f];
    [regButton3 setTitle:@"GET" forState:UIControlStateNormal];
    [regButton3 setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [regButton3 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [regButton3 setLinkString:@"https://itunes.apple.com/us/app/rps-rock-paper-scissors-game/id913408397?mt=8"];
    [self.appSpotlightView addSubview:regButton3];
    
    BB *regButton4 = [[BB alloc] initWithFrame:CGRectMake(272, 1233, 60, 30)];
    regButton4.layer.borderWidth = 1.0f;
    regButton4.layer.cornerRadius = 5.0f;
    regButton4.layer.borderColor = [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    regButton4.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f];
    [regButton4 setTitle:@"GET" forState:UIControlStateNormal];
    [regButton4 setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [regButton4 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [regButton4 setLinkString:@"https://itunes.apple.com/us/app/prodigus/id777375668?mt=8"];
    [self.appSpotlightView addSubview:regButton4];
    
    BB *regButton5 = [[BB alloc] initWithFrame:CGRectMake(272, 1633, 60, 30)];
    regButton5.layer.borderWidth = 1.0f;
    regButton5.layer.cornerRadius = 5.0f;
    regButton5.layer.borderColor = [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    regButton5.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f];
    [regButton5 setTitle:@"GET" forState:UIControlStateNormal];
    [regButton5 setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [regButton5 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [regButton5 setLinkString:@"https://itunes.apple.com/us/app/stainless-browser/id674154689?mt=8"];
    [self.appSpotlightView addSubview:regButton5];
    
    self.triviaIconButton.layer.borderWidth = 1.0f;
    self.triviaIconButton.layer.cornerRadius = 16.0f;
    self.triviaIconButton.layer.masksToBounds = YES;
    self.triviaIconButton.layer.borderColor = [[UIColor clearColor] CGColor];
    
    self.iTapIconButton.layer.borderWidth = 1.0f;
    self.iTapIconButton.layer.cornerRadius = 16.0f;
    self.iTapIconButton.layer.masksToBounds = YES;
    self.iTapIconButton.layer.borderColor = [[UIColor clearColor] CGColor];
    
    self.rpsIconButton.layer.borderWidth = 1.0f;
    self.rpsIconButton.layer.cornerRadius = 16.0f;
    self.rpsIconButton.layer.masksToBounds = YES;
    self.rpsIconButton.layer.borderColor = [[UIColor clearColor] CGColor];
    
    self.stainlessIconButton.layer.borderWidth = 1.0f;
    self.stainlessIconButton.layer.cornerRadius = 16.0f;
    self.stainlessIconButton.layer.masksToBounds = YES;
    self.stainlessIconButton.layer.borderColor = [[UIColor clearColor] CGColor];
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
