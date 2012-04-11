//
//  AboutViewController.h
//  Summer
//
//  Created by Jonathan Hirz on 2/25/12.
//  Copyright (c) 2012 SuaveApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface AboutViewController : UIViewController <WebViewControllerDelegate>

- (IBAction)linkToQuadrobounce:(id)sender;
- (IBAction)linkToEmail:(id)sender;
- (IBAction)linkToTwitter:(id)sender;
- (IBAction)linkToWeb:(id)sender;


@end
