//
//  SCSMasterViewController.h
//  FeedMeHD
//
//  Created by Daniel Steinberg on 4/2/14.
//  Copyright (c) 2014 CS 193P. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCSDetailViewController;

@interface SCSMasterViewController : UITableViewController

@property (strong, nonatomic) SCSDetailViewController *detailViewController;

@end
