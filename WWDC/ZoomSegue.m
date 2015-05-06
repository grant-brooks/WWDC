//
//  ZoomSegue.m
//  WWDC
//
//  Created by Grant Goodman on 3/15/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "ZoomSegue.h"

@implementation ZoomSegue : UIStoryboardSegue

- (void)perform
{
    UIViewController *src = self.sourceViewController;
    UIViewController *dst = self.destinationViewController;
    
    [src presentViewController:dst animated:NO completion:^{
        dst.view.backgroundColor = [UIColor redColor];
        dst.view.alpha = 1;
        dst.view.opaque = NO;
        [UIView animateWithDuration:1.5 animations:^{
            dst.view.alpha = 1;
            dst.view.backgroundColor = [UIColor blueColor];
        }];
    }];
    /*
    [UIView transitionFromView:src.view
                        toView:dst.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionShowHideTransitionViews
                    completion:nil
     ];
*/
}

@end
