//
//  Clock-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Clock-Controller.h"
#import "ViewController.h"
#import "Background-Button.h"
#import "Circular-Button.h"

@interface CLC ()

@end

@implementation CLC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self.timerToolbar setClipsToBounds:YES];
    
    [self.cancelButton drawCircularButton:[UIColor redColor]];
    [self.pauseButton drawCircularButton:[UIColor blackColor]];
    
    NSString *str =@"6/08/2015";
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    self.targetDate = [formatter dateFromString:str];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (void)updateCounter:(NSTimer *)theTimer
{
    NSDate *now = [NSDate date];
    if ([self.targetDate earlierDate:now] == self.targetDate)
    {
        [theTimer invalidate];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        NSUInteger flags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:now toDate:self.targetDate options:0];
#pragma clang diagostic pop
        
        self.timerLabel.text = [NSString stringWithFormat:@"%ld:%ld:%ld", (long)[components hour], (long)[components minute], (long)[components second]];
    }
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
