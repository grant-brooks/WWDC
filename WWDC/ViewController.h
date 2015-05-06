//
//  ViewController.h
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizer;
- (IBAction)swipeGestureRecognizer:(id)sender;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *backGestureRecognizer;
- (IBAction)backGestureRecognizer:(id)sender;

@end

