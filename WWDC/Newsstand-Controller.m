//
//  Newsstand-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Newsstand-Controller.h"
#import "Article-Controller.h"
#import "ViewController.h"

@interface NC ()

@end

@implementation NC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Set the background of the view to the image.
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self addToolbars];
}

- (void)addToolbars
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 567, 414, 110)];
        [toolbar setAlpha:1.0];
        [self.view addSubview:toolbar];
        [self.view sendSubviewToBack:toolbar];
        
        UIToolbar *fourthNewsBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 414, 147)];
        [fourthNewsBar setAlpha:0.8];
        [fourthNewsBar setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:fourthNewsBar];
        [self.view sendSubviewToBack:fourthNewsBar];
        
    });
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"wsjSegue"])
    {
        ARC *viewController = segue.destinationViewController;
        viewController.articleToLoad = @"http://www.wsj.com/articles/apples-new-whiz-kids-1409342714/";
    }
    
    if ([segue.identifier isEqualToString:@"tolSegue"])
    {
        ARC *viewController = segue.destinationViewController;
        viewController.articleToLoad = @"http://www.thetimes.co.uk/tto/business/industries/technology/article4223896.ece";
    }
    
    if ([segue.identifier isEqualToString:@"exploSegue"])
    {
        ARC *viewController = segue.destinationViewController;
        viewController.articleToLoad = @"http://www.explo.org/live/conversations/meet_grant_goodman_explo_alum_tech_entrepreneur/";
    }
}

@end
