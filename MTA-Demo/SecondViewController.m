//
//  SecondViewController.m
//  MTA-Demo
//
//  Created by WQY on 12-12-10.
//  Copyright (c) 2012年 developer. All rights reserved.
//

#import "SecondViewController.h"
#import "MTA.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize kvButton;
@synthesize exceptionButton;
@synthesize startKvButton;
@synthesize endKvButton;

-(IBAction) clickKVButton:(id)sender{
    //[MTA trackCustomEvent:@"NormalEvent" args:[NSArray arrayWithObject:@"arg0"]];
    [MTA trackCustomKeyValueEvent:@"KVEvent" props:[NSDictionary dictionaryWithObject:@"Value" forKey:@"Key"]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"生成KeyValue事件"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}
-(IBAction) clickExceptionButton:(id)sender{
    //NSLog(@"Error button clicked");
    NSException* ex = [NSException exceptionWithName:@"DemoException" reason:@"NoReason" userInfo:nil];
    [MTA trackException:ex];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"生成Crash事件(进程会Crash，下次启动时上报)"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    [NSArray arrayWithObject:nil];
}
-(IBAction) clickStartKvButton:(id)sender{
    //NSLog(@"Start button clicked");
    [MTA trackCustomKeyValueEventBegin :@"KVEvent" props:[NSDictionary dictionaryWithObject:@"Value" forKey:@"TimeKey"]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"开始KeyValue计时事件"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}
-(IBAction) clickEndKvButton:(id)sender{
    [MTA trackCustomKeyValueEventEnd :@"KVEvent" props:[NSDictionary dictionaryWithObject:@"Value" forKey:@"TimeKey"]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                    message:@"结束KeyValue计时事件"
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
        self.title = NSLocalizedString(@"页面2", @"页面2");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
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
    NSString* page = @"Page2";
    [super viewDidAppear:animated];
    [MTA trackPageViewBegin:page];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSString* page = @"Page2";
    [MTA trackPageViewEnd:page];
}

-(void) viewDidDisappear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
