//
//  App-Store-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *appSpotlightView;
@property (weak, nonatomic) IBOutlet UIButton *triviaIconButton;
@property (weak, nonatomic) IBOutlet UIButton *iTapIconButton;
@property (weak, nonatomic) IBOutlet UIButton *rpsIconButton;
@property (weak, nonatomic) IBOutlet UIButton *stainlessIconButton;
@property (weak, nonatomic) IBOutlet UITabBar *appStoreTabBar;

@end
