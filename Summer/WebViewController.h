//
//  WebViewController.h
//  Summer
//
//  Created by Jonathan Hirz on 2/28/12.
//  Copyright (c) 2012 SuaveApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;

@protocol WebViewControllerDelegate <NSObject>
- (void)webViewControllerDidHitBack:(WebViewController *)controller;

@end

@interface WebViewController : UIViewController 

@property (nonatomic, weak) IBOutlet UIWebView *blogWebView;
@property (nonatomic, weak) id <WebViewControllerDelegate> delegate;

- (IBAction)back:(id)sender;

@end
