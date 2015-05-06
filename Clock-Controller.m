//
//  Clock-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright (c) 2015 Macster Software Inc. All rights reserved.
//

#import "Clock-Controller.h"
#import "ViewController.h"

@interface CLC ()

@end

@implementation CLC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
