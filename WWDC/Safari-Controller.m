//
//  Safari-Controller.m
//  WWDC
//
//  Created by Grant Goodman on 3/14/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Safari-Controller.h"
#import "ViewController.h"

@interface SC () <UISearchBarDelegate, UIWebViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation SC
{
    BOOL searchBarEditing;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Set the style of the UISearchBar to minimal.
    [self.searchBar setSearchBarStyle:UISearchBarStyleMinimal];
    
    //Check wether the UIWebView can go backward or forward, and set the button toggle settings appropriately.
    [self backwardForwardCheck];
    
    //Set the images for the refresh button on the UISearchBar, taking place of the bookmark icon.
    [self.searchBar setImage:[UIImage imageNamed:@"Refresh.png"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    [self.searchBar setImage:[UIImage imageNamed:@"Refresh-Highlighted.png"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    
    //Hide the bookmark icon on the UISearchBar.
    [self.searchBar setShowsBookmarkButton:NO];
    
    //Format the string correctly for the first website visit.
    NSString *finalSearchString = @"http://www.macstersoftware.com/";
    
    //Initialize a request for the UIWebView.
    NSURL *requestURL = [NSURL URLWithString:finalSearchString];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:requestURL];
    
    //Load the request for the UIWebview.
    [self.webView loadRequest:requestObject];
    
    [self.webView setDelegate:self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //Hide the keyboard.
    [searchBar resignFirstResponder];
    
    //Log the text of the UISearchBar to the console.
    NSLog(@"Search Text: '%@'.", self.searchBar.text);
    
    //Format the string correctly for a Google search.
    NSString *initialSearchString = [@"https://www.google.com/search?source=ig&hl=en&rlz=&q=" stringByAppendingString:self.searchBar.text];
    NSString *finalSearchString = [initialSearchString stringByReplacingOccurrencesOfString:@" " withString: @"+"];
    
    //Initialize a request for the UIWebView.
    NSURL *requestURL = [NSURL URLWithString:finalSearchString];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:requestURL];
    
    //Load the request for the UIWebview.
    [self.webView loadRequest:requestObject];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    //Set the 'searchBarEditing' boolean value to 'YES'.
    searchBarEditing = YES;
    
    //Set the text of the UISearchBar to the web URL.
    [self.searchBar setText:self.webView.request.URL.absoluteString];
    
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    //Set the 'searchBarEditing' boolean value to 'NO'.
    searchBarEditing = NO;
    
    //If the UISearchBar's text length is 0, (meaning the user has not entered a term), set the text to the web URL and show the bookmark button again.
    if (searchBar.text.length == 0)
    {
        [searchBar setText:self.webView.request.URL.absoluteString];
        [self.searchBar setShowsBookmarkButton:YES];
    }
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //If the clear button on the UISearchBar is tapped, call the 'hideBookmarkButton' method.
    if ([searchText length] == 0)
    {
        [self performSelector:@selector(hideBookmarkButton:) withObject:searchBar afterDelay:0];
    }
}

- (void)hideBookmarkButton:(UISearchBar *)searchBar
{
    //Hide the bookmark button on the UISearchBar, as not to display it on the UISearchBar while editing.
    [self.searchBar setShowsBookmarkButton:NO];
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
    if (searchBarEditing)
    {
        //Hide the network activity spinner in the status bar.
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        //Check wether the UIWebView can go backward or forward, and set the button toggle settings appropriately.
        [self backwardForwardCheck];
        
        //If the UISearchBar's text length is not 0, (meaning the user has entered a term), show the bookmark button again. Otherwise, hide the bookmark icon.
        if(!self.searchBar.text.length == 0)
        {
            [self.searchBar setShowsBookmarkButton:YES];
        }
        else
        {
            [self.searchBar setShowsBookmarkButton:NO];
        }
        
        //Set the text of the UISearchBar to the web URL.
        [self.searchBar setText:self.webView.request.URL.absoluteString];
        
        //Set our UISearchBar up so it acts like Safari's does.
        [self configureSearchBarView:[self searchBar]];
    }
    else
    {
        //Hide the network activity spinner in the status bar.
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        //Set the 'pageTitle' string to the title of the web page.
        self.pageTitle = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
        
        //Check wether the UIWebView can go backward or forward, and set the button toggle settings appropriately.
        [self backwardForwardCheck];
        
        //If the UISearchBar's text length is not 0, (meaning the user has entered a term), show the bookmark button again. Otherwise, hide the bookmark icon.
        if(!self.searchBar.text.length == 0)
        {
            [self.searchBar setShowsBookmarkButton:YES];
        }
        else
        {
            [self.searchBar setShowsBookmarkButton:NO];
        }
        
        //Set the text of the UISearchBar to the page title.
        [self.searchBar setText:self.pageTitle];
        
        //Set our UISearchBar up so it acts like Safari's does.
        [self configureSearchBarView:[self searchBar]];
    }
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

- (IBAction)shareButton:(id)sender
{
    NSString *linkString = self.webView.request.URL.absoluteString;
    
    self.uavc = [[UIActivityViewController alloc] initWithActivityItems:@[linkString] applicationActivities:nil];
    
    [self presentViewController:self.uavc animated:YES completion:nil];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    //Initialize a request for the UIWebView.
    NSURL *requestURL = self.webView.request.URL.absoluteURL;
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:requestURL];
    
    //Load the request for the UIWebview.
    [self.webView loadRequest:requestObject];
}

- (void)configureSearchBarView:(UIView*)view
{
    //Sets our UISearchBar up so it acts like Safari's does.
    for (UIView *subview in [view subviews])
    {
        [self configureSearchBarView:subview];
    }
    
    if ([view conformsToProtocol:@protocol(UITextInputTraits)])
    {
        [(UITextField *)view setClearButtonMode:UITextFieldViewModeWhileEditing];
        [(UITextField *)view setLeftViewMode:UITextFieldViewModeWhileEditing];
        [(UITextField *)view setTextAlignment:NSTextAlignmentCenter];
    }
}

- (IBAction)homeButton:(id)sender
{
    [self.controlNavigationBar setDelegate:nil];
    [self.searchBar setDelegate:nil];
    [self.webView setDelegate:nil];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
