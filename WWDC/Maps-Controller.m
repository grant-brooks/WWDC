//
//  Maps-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Maps-Controller.h"
#import "ViewController.h"

@interface MPC ()

@end

@implementation MPC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self performSelector:@selector(zoomToHome)
               withObject:nil
               afterDelay:3];
    
    [self.mapsToolbar setClipsToBounds:YES];
    [self.secondMapsToolbar setClipsToBounds:YES];
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(void)zoomToHome
{
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.longitude = -73.644444;
    region.center.latitude = 40.846389;
    region.span.longitudeDelta = 0.15f;
    region.span.latitudeDelta = 0.15f;
    [self.mapView setRegion:region animated:YES];
    
    [self performSelector:@selector(zoomToMoscone)
               withObject:nil
               afterDelay:5];
}

-(void)zoomToMoscone
{
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.longitude = -122.4016;
    region.center.latitude = 37.7842;
    region.span.longitudeDelta = 0.0f;
    region.span.latitudeDelta = 0.0f;
    [self.mapView setRegion:region animated:YES];
    
    [self performSelector:@selector(zoomToHQ)
               withObject:nil
               afterDelay:5];
}

-(void)zoomToHQ
{
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.longitude = -122.03118;
    region.center.latitude = 37.33182;
    region.span.longitudeDelta = 0.0f;
    region.span.latitudeDelta = 0.0f;
    [self.mapView setRegion:region animated:YES];
    
    [self performSelector:@selector(zoomToHome)
               withObject:nil
               afterDelay:5];
}

@end
