//
//  Photo-View-Controller.h
//  WWDC
//
//  Created by Grant Goodman on 4/19/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButton:(id)sender;
@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *navigationBarTitle;

@end
