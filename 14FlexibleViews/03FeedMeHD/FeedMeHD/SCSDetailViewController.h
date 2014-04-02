//
//  SCSDetailViewController.h
//  FeedMeHD
//
//  Created by Daniel Steinberg on 4/2/14.
//  Copyright (c) 2014 CS 193P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
