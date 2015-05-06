//
//  Clock-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Circular-Button.h"

@interface CLC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *timerToolbar;
@property (weak, nonatomic) IBOutlet CB *cancelButton;
@property (weak, nonatomic) IBOutlet CB *pauseButton;
@property (strong, nonatomic) NSDate *targetDate;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@end
