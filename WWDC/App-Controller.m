//
//  App-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 4/8/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "App-Controller.h"
#import "Background-Button.h"
#import "ViewController.h"

@interface APC ()

@end

@implementation APC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self.secondToolbar setClipsToBounds:YES];
    
    self.appIconImageView.layer.borderWidth = 1.0f;
    self.appIconImageView.layer.cornerRadius = 30.0f;
    self.appIconImageView.layer.masksToBounds = YES;
    self.appIconImageView.layer.borderColor = [[UIColor clearColor] CGColor];
    
    BB *regButton = [[BB alloc] initWithFrame:CGRectMake(273, 184, 130, 30)];
    regButton.layer.borderWidth = 1.0f;
    regButton.layer.cornerRadius = 5.0f;
    regButton.layer.borderColor = [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    regButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f];
    [regButton setTitle:@"VIEW ON STORE" forState:UIControlStateNormal];
    [regButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [regButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [regButton setLinkString:@"https://itunes.apple.com/us/artist/rebecca-goodman/id863405963"];
    [self.view addSubview:regButton];
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)shareButton:(id)sender
{
    NSString *linkString = @"Grant Goodman https://itunes.apple.com/us/artist/rebecca-goodman/id863405963";
    
    self.uavc = [[UIActivityViewController alloc] initWithActivityItems:@[linkString] applicationActivities:nil];
    
    [self presentViewController:self.uavc animated:YES completion:nil];
}

@end
