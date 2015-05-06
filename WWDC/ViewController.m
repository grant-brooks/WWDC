//
//  ViewController.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL goneAlready;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set the background of the view to the image.
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 631, 414, 105)];
    [toolbar setAlpha:0.8];
    [toolbar setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:toolbar];
    [self.view sendSubviewToBack:toolbar];
    
    //Sets up the vertical effect for the simple parallax.
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-10);
    verticalMotionEffect.maximumRelativeValue = @(10);
    
    //Sets up the horizontal effect for the simple parallax.
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-10);
    horizontalMotionEffect.maximumRelativeValue = @(10);
    
    //Creates a group to combine them both.
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    //Adds both of the parallax effects to the view.
    [self.view addMotionEffect:group];
    
    if (!goneAlready == YES)
    {
        UIAlertView *hiAlert = [[UIAlertView alloc] initWithTitle:@"Welcome!" message:@"Hi, my name is Grant Goodman, I am a fifteen-year-old iOS developer who was fortunate enough to attend WWDC last year, and it was truly a life-changing experience for me. I loved every minute of it. This year, my application has been über beefed-up, and compiled over one-thousand times. Every 'application' you see relates to a different aspect of my life. Feel free to look at all applications that are enabled, just like you would in iOS. Believe it or not, I actually made all icons in Adobe Illustrator from scratch, so nothing should cause any copyright issues! Enjoy!" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [hiAlert show];
        goneAlready = YES;
    }
    
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)swipeGestureRecognizer:(id)sender
{
    [self performSegueWithIdentifier:@"nextPageSegue" sender:self];
}

- (IBAction)backGestureRecognizer:(id)sender
{
    [self performSegueWithIdentifier:@"backPageSegue" sender:self];
}

@end
