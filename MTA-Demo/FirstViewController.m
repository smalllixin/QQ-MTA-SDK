//
//  FirstViewController.m
//  MTA-Demo
//
//  Created by WQY on 12-12-10.
//  Copyright (c) 2012年 developer. All rights reserved.
//

#import "FirstViewController.h"
#import "MTA.h"
#import "MTAConfig.h"

@interface FirstViewController ()


@end

@implementation FirstViewController

@synthesize normalButton;
@synthesize errorButton;
@synthesize startButton;
@synthesize endButton;

-(IBAction) clickNormaltButton:(id)sender{
    
    
    
    [NSArray arrayWithObjects:(@"arg1"), nil];
    [MTA trackCustomEvent:@"NormalEvent" args:[NSArray arrayWithObject:@"arg0"]];
    
    
    
    //[MTA trackCustomEvent:@"NormalEvent" args:[NSArray arrayWithObjects:(@"arg1"), nil]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"生成普通事件"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    /* Trigger a crash Test */
    NSArray *array = [NSArray array];
    [array objectAtIndex:23];
     
    
    [alert show];
    [alert release];
}
-(IBAction) clickErrorButton:(id)sender{
    //NSLog(@"Error button clicked");
    [MTA trackError:@"I\'m an unexpected error"];
    //[MTA4QC trackError:@"I'm an unexpected error"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"生成Error事件"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];

}
-(IBAction) clickStartButton:(id)sender{
    //NSLog(@"Start button clicked");
    [MTA trackCustomEventBegin:@"TimeEvent" args:[NSArray arrayWithObject:@"arg0"]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"开始计时事件"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}
-(IBAction) clickEndButton:(id)sender{
    //NSLog(@"End button clicked");
    [MTA trackCustomEventEnd:@"TimeEvent" args:[NSArray arrayWithObject:@"arg0"]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"结束计时事件"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"页面1", @"页面1");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewDidAppear:(BOOL)animated
{
    NSString* page = @"Page1";
    [MTA trackPageViewBegin:page];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSString* page = @"Page1";
    [MTA trackPageViewEnd:page];
}

/*
-(void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"FirstView viewDidDisappear");
    NSString* page = @"Page1";
    [MTA trackPageViewEnd:page];
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
