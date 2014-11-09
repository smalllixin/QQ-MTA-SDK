//
//  FeedbackViewController.h
//  MTA-Demo
//
//  Created by xiangchen on 18/08/14.
//  Copyright (c) 2014 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

static UITapGestureRecognizer *tapRecognizer;

@interface FeedbackViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    
}

@property (retain, nonatomic) IBOutlet UITableView *mTbView;
@property (retain, nonatomic) IBOutlet UIToolbar *mTlBar;

@property (nonatomic, retain) NSMutableArray *mData;

@property (retain, nonatomic) IBOutlet UINavigationBar *navBar;

@property(nonatomic, retain) UITextField *mTextField;

- (IBAction)sendFeedback:(id)sender;
@end
