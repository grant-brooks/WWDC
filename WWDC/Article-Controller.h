//
//  Article-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 3/23/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARC : UIViewController

//Interface Builder UI Elements
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UIButton *openInSafariButton;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

//Strings
@property (strong, nonatomic) NSString *articleToLoad;
@property (strong, nonatomic) NSString *pageTitle;

//Interface Builder Actions
- (IBAction)backButton:(id)sender;
- (IBAction)doneButton:(id)sender;
- (IBAction)forwardButton:(id)sender;
- (IBAction)openInSafariButton:(id)sender;

@end
