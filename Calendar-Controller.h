//
//  Calendar-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *calendarToolbar;
@property (weak, nonatomic) IBOutlet UIToolbar *secondCalendarToolbar;
@property (weak, nonatomic) IBOutlet UISearchBar *calendarSearchBar;
@property (weak, nonatomic) IBOutlet UIButton *calendarBackButton;
- (IBAction)calendarBackButton:(id)sender;

@end
