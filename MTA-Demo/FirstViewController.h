//
//  FirstViewController.h
//  MTA-Demo
//
//  Created by WQY on 12-12-10.
//  Copyright (c) 2012年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (retain,nonatomic)IBOutlet UIButton *normalButton;
@property(retain,nonatomic)IBOutlet UIButton *errorButton;
@property(retain,nonatomic)IBOutlet UIButton *startButton;
@property(retain,nonatomic)IBOutlet UIButton *endButton;



-(IBAction) clickNormaltButton:(id)sender;
-(IBAction) clickErrorButton:(id)sender;
-(IBAction) clickStartButton:(id)sender;
-(IBAction) clickEndButton:(id)sender;

@end
