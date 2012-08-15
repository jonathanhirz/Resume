//
//  WebViewController.m
//  Summer
//
//  Created by Jonathan Hirz on 2/28/12.
//  Copyright (c) 2012 SuaveApps. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize blogWebView;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
    blogWebView.delegate = (id)self;
    [blogWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://jonathanhirz.com"]]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBlogWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)webViewDidStartLoad:(UIWebView *)blogWebView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)blogWebView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)back:(id)sender {
    [self.delegate webViewControllerDidHitBack:self];
}


@end
