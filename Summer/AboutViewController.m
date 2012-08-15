//
//  AboutViewController.m
//  Summer
//
//  Created by Jonathan Hirz on 2/25/12.
//  Copyright (c) 2012 SuaveApps. All rights reserved.
//
//  Icon Copyrights: Email and Homepage icon - ipapun http://ipapun.deviantart.com/
//                   Twitter icon - brsev http://brsev.deviantart.com/
// testing again

#import "AboutViewController.h"
#import <MessageUI/MessageUI.h>
#import <Twitter/Twitter.h>

@interface AboutViewController ()

@end

@implementation AboutViewController

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)linkToQuadrobounce:(id)sender {
    //link to quadrobounce page in the app store. 
    //maybe add a popup that says you'll be leaving this app
    NSLog(@"link to quadrobounce");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://github.com/jonathanhirz"]];
}

- (IBAction)linkToEmail:(id)sender {
    //slide up from bottom, email sender thing with 'jonathanhirz@me.com' pre-loaded
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    mailViewController.mailComposeDelegate = (id)self;
    [mailViewController setToRecipients:[NSArray arrayWithObject:@"jonathanhirz@me.com"]];
    [self presentModalViewController:mailViewController animated:YES];
    
    NSLog(@"link to email");
}

- (IBAction)linkToTwitter:(id)sender {
    //load up iOS 5 twitter sender thing, '@jonnysuave'
    TWTweetComposeViewController *tweetViewController = [[TWTweetComposeViewController alloc] init];
    [tweetViewController setInitialText:@"@jonnysuave "];
    [self presentModalViewController:tweetViewController animated:YES];
    
    //tweet success/error alert box
    tweetViewController.completionHandler = ^(TWTweetComposeViewControllerResult result) {
        /* //commented out because alert box is kind of obtrusive, but the code is good :)
        NSString *title = @"Status";
        NSString *msg;
        
        if (result == TWTweetComposeViewControllerResultCancelled)
            msg = @"Tweet was cancelled.";
        if (result == TWTweetComposeViewControllerResultDone)
            msg = @"Tweet sent!";
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alertView show];
         */
        [self dismissModalViewControllerAnimated:YES];
        
    };
    
    NSLog(@"link to twitter");
}

- (IBAction)linkToWeb:(id)sender {
    //slide up from bottom UIWebView with http://suaveapps.tumblr.com
    NSLog(@"link to web");
    // below works, loads link in Safari, but I want a slide up UIWevView!!
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://suaveapps.tumblr.com"]];

}

#pragma mark - WebViewControllerDelegate

- (void)webViewControllerDidHitBack:(WebViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"WebView"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        WebViewController *webViewController = [[navigationController viewControllers] objectAtIndex:0];
        webViewController.delegate = self;
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];
}

@end




