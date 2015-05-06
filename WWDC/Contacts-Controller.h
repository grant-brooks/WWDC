//
//  Contacts-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 3/23/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Custom Framework Imports
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CNC : UIViewController<MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
- (IBAction)callButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
- (IBAction)emailButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *personalSiteButton;
- (IBAction)personalSiteButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *websiteButton;
- (IBAction)websiteButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendMessageButton;
- (IBAction)sendMessageButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *shareContactButton;
- (IBAction)shareContactButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *linkedInButton;
- (IBAction)linkedInButton:(id)sender;

@end
