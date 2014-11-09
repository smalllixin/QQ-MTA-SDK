//
//  SecondViewController.h
//  MTA-Demo
//
//  Created by WQY on 12-12-10.
//  Copyright (c) 2012年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (retain,nonatomic)IBOutlet UIButton *kvButton;
@property(retain,nonatomic)IBOutlet UIButton *exceptionButton;
@property(retain,nonatomic)IBOutlet UIButton *startKvButton;
@property(retain,nonatomic)IBOutlet UIButton *endKvButton;


-(IBAction) clickKVButton:(id)sender;
-(IBAction) clickExceptionButton:(id)sender;
-(IBAction) clickStartKvButton:(id)sender;
-(IBAction) clickEndKvButton:(id)sender;
@end
