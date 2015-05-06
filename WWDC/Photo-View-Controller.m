//
//  Photo-View-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 4/19/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Photo-View-Controller.h"
#import "ViewController.h"

@interface PVC ()

@end

@implementation PVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
    
    UIImageView *mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 91, 414, 510)];
    [mainImageView setImage:[UIImage imageNamed:self.imageString]];
    [self.view addSubview:mainImageView];
    
    [self.navigationItem setTitle:self.navigationBarTitle];
    
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
