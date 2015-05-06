//
//  Contacts-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/23/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Contacts-Controller.h"

//Custom Header Imports
#import "ViewController.h"

@interface CNC ()

@end

@implementation CNC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Updates the appearance of the status bar.
    [self setNeedsStatusBarAppearanceUpdate];
    
    UIImage *callImage = [[UIImage imageNamed:@"Call Button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.callButton setImage:callImage forState:UIControlStateNormal];
}

- (IBAction)homeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (IBAction)callButton:(id)sender
{
    NSURL *numberURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://516-361-4836"]];
    
    if ([[UIApplication sharedApplication] canOpenURL:numberURL]) {
        [[UIApplication sharedApplication] openURL:numberURL];
    }
    else
    {
        UIAlertView *incompatibleDeviceAlert = [[UIAlertView alloc]initWithTitle:@"Incompatible Device" message:@"Your device is not eligible for this feature." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [incompatibleDeviceAlert show];
    }
}

- (IBAction)emailButton:(id)sender
{
    if([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *composeMailController = [[MFMailComposeViewController alloc] init];
        [composeMailController setMailComposeDelegate:self];
        
        [composeMailController setToRecipients:[NSArray arrayWithObject:@"ggoodman@macstersoftware.com"]];
        
        [self presentViewController:composeMailController animated:YES completion:nil];
    }
}

- (IBAction)personalSiteButton:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.grantbrooksgoodman.io/"]];
}

- (IBAction)websiteButton:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.macstersoftware.com/"]];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView * textView in self.view.subviews)
    {
        if ([textView isKindOfClass:[UITextView class]] && [textView isFirstResponder])
        {
            [textView resignFirstResponder];
        }
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-w"
- (IBAction)sendMessageButton:(id)sender
{
    if(![MFMessageComposeViewController canSendText])
    {
        UIAlertView *incompatibleDeviceAlert = [[UIAlertView alloc] initWithTitle:@"Incompatible Device" message:@"Your device is not eligible for this feature." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [incompatibleDeviceAlert show];
        
        return;
    }
    
    NSArray *messageRecipents = @[@"516-361-4836"];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    [messageController setMessageComposeDelegate:(id<MFMessageComposeViewControllerDelegate>)self];
    [messageController setRecipients:messageRecipents];
    
    [self presentViewController:messageController animated:YES completion:nil];
}
#pragma clang diagnostic pop

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Unknown Error" message:@"Unable to send messgae." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            [warningAlert show];
            
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)shareContactButton:(id)sender
{
    [self shareText:nil andImage:nil andUrl:nil];
}

- (void)shareText:(NSString *)text andImage:(UIImage *)image andUrl:(NSURL *)url
{
    //Code for sharing photos.
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (text) {
        [sharingItems addObject:text];
    }
    if (image) {
        [sharingItems addObject:image];
    }
    if (url) {
        [sharingItems addObject:url];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (IBAction)linkedInButton:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.linkedin.com/pub/grant-goodman/b1/622/b2a/"]];
}

@end
