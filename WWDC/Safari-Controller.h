//
//  Safari-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SC : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;

//Interface Builder UI Elements
@property (strong, nonatomic) IBOutlet UIToolbar *controlNavigationBar;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;

//Strings
@property (strong, nonatomic) NSString *pageTitle;

//Interface Builder Actions
- (IBAction)backButton:(id)sender;
- (IBAction)forwardButton:(id)sender;
- (IBAction)shareButton:(id)sender;

//Other Non-Interface Builder UI Elements
@property (strong, nonatomic) UIActivityViewController *uavc;

@end
