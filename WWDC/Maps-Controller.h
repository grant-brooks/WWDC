//
//  Maps-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MPC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIToolbar *mapsToolbar;
@property (weak, nonatomic) IBOutlet UIToolbar *secondMapsToolbar;

@end
