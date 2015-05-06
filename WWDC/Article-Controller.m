//
//  Article-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Article-Controller.h"
#import "ViewController.h"

@interface ARC () <UISearchBarDelegate, UIWebViewDelegate, UIGestureRecognizerDelegate, UIAlertViewDelegate>

@end

@implementation ARC

//Helpful Custom Methods
-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) return [UIColor grayColor];
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

//View Controller Code
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Check wether the UIWebView can go backward or forward, and set the button toggle settings appropriately.
    [self backwardForwardCheck];
    
    //Initialize a request for the UIWebView.
    NSURL *requestURL = [NSURL URLWithString:self.articleToLoad];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:requestURL];
    
    //Load the request for the UIWebview.
    [self.webView loadRequest:requestObject];
    
    //Add the toolbar to the view as a subview.
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 414, 64)];
    [toolbar setAlpha:0.7];
    [toolbar setBarTintColor:[self colorWithHexString:@"ECF0F1"]];
    [self.view addSubview:toolbar];
    [self.view sendSubviewToBack:toolbar];
}

- (void)backwardForwardCheck
{
    //If the UIWebView cannot go back, disable the backButton. If the UIWebView can go back, enable the backButton.
    if (![self.webView canGoBack])
    {
        [self.backButton setEnabled:NO];
    }
    else if ([self.webView canGoBack])
    {
        [self.backButton setEnabled:YES];
    }
    
    //If the UIWebView cannot go forward, disable the forwardButton. If the UIWebView can go forward, enable the forwardButton.
    if (![self.webView canGoForward])
    {
        [self.forwardButton setEnabled:NO];
    }
    else if ([self.webView canGoForward])
    {
        [self.forwardButton setEnabled:YES];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //Check wether the UIWebView can go backward or forward, and set the button toggle settings appropriately.
    [self backwardForwardCheck];
    
    //Show the network activity spinner in the status bar.
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //Hide the network activity spinner in the status bar.
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    //Set the 'pageTitle' string to the title of the web page.
    self.pageTitle = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    //Set the 'titleLabel' label to the title of the web page.
    self.titleLabel.text = self.pageTitle;
    
    //Check wether the UIWebView can go backward or forward, and set the button toggle settings appropriately.
    [self backwardForwardCheck];
}

- (IBAction)backButton:(id)sender
{
    //Tell the UIWebView to go back one page.
    [self.webView goBack];
}

- (IBAction)forwardButton:(id)sender
{
    //Tell the UIWebView to go forward one page.
    [self.webView goForward];
}

- (IBAction)doneButton:(id)sender
{
    [self.webView setDelegate:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)openInSafariButton:(id)sender
{
    UIAlertView *openAlert = [[UIAlertView alloc] initWithTitle:@"Redirect Notice" message:@"You will be redirected to Safari to view this link, continue?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [openAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:self.webView.request.URL.absoluteURL];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
