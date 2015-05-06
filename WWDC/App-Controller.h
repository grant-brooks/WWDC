//
//  App-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 4/8/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *secondToolbar;
@property (weak, nonatomic) IBOutlet UIImageView *appIconImageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;
- (IBAction)shareButton:(id)sender;
@property (strong, nonatomic) UIActivityViewController *uavc;

@end
