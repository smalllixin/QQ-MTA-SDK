//
//  FeedbackViewController.m
//  MTA-Demo
//
//  Created by xiangchen on 18/08/14.
//  Copyright (c) 2014 developer. All rights reserved.
//

#import "FeedbackViewController.h"

#import "RightTableViewCell.h"

#import "MTA.h"

@implementation FeedbackViewController{
    CGFloat tbViewTop;
    bool needScroll;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"用户反馈", @"用户反馈");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    
    return self;
}

- (void)initMTbView{
    _mData = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSMutableDictionary *subDict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [subDict setObject:@"产品经理的内容" forKey:@"content"];
    [subDict setObject:@"2014-08-19 10:17:52" forKey:@"datetime"];
    [subDict setObject:@"dev_reply" forKey:@"type"];
    [_mData addObject:subDict];
    
    NSMutableDictionary *subDict2 = [[NSMutableDictionary alloc] initWithCapacity:0];
    [subDict2 setObject:@"测试回复dsfsdf" forKey:@"content"];
    [subDict2 setObject:@"2014-08-17 10:17:52" forKey:@"datetime"];
    [subDict2 setObject:@"user_reply" forKey:@"type"];
    [_mData addObject:subDict2];
    
    [_mTbView setSeparatorColor:[UIColor clearColor]];
    
    //NSLog(@"arr is %@",arr);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initMTbView];
    
    [self setupToolbar];
    
    [self handleKeyboard];
    
    //创建一个导航栏
    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    
    
    //创建一个导航栏集合
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:nil];
    //在这个集合Item中添加标题，按钮
    //style:设置按钮的风格，一共有三种选择
    //action：@selector:设置按钮的点击事件
    //创建一个左边按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"网页" style:UIBarButtonItemStyleBordered target:self action:@selector(clickLeftButton)];
    //创建一个右边按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Native" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton)];
    
    //设置导航栏的内容
    [navItem setTitle:@"用户反馈"];
    
    //把导航栏集合添加到导航栏中，设置动画关闭
    [_navBar pushNavigationItem:navItem animated:NO];
    
    //把左右两个按钮添加到导航栏集合中去
    [navItem setLeftBarButtonItem:leftButton];
    [navItem setRightBarButtonItem:rightButton];
    
    //将标题栏中的内容全部添加到主视图当中
    [self.view addSubview:_navBar];
    
    //最后将控件在内存中释放掉，以避免内存泄露
    [navItem release];
    [leftButton release];
    [rightButton release];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)setupToolbar {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    button.frame = CGRectMake(256, 7, 57.0f, 30.0f);
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendFeedback:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mTlBar addSubview:button];
    
    [self setupTextField];
    
}

- (void)setupTextField {
    _mTextField = [[UITextField alloc] initWithFrame:CGRectMake(6, 7, _mTlBar.frame.size.width - 74.0f, 30.0f)];
    _mTextField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _mTextField.backgroundColor = [UIColor whiteColor];
    _mTextField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _mTextField.textAlignment = NSTextAlignmentLeft;
    _mTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _mTextField.borderStyle = UITextBorderStyleLine;
    _mTextField.font = [UIFont systemFontOfSize:14.0f];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _mTextField.leftView = paddingView;
    _mTextField.leftViewMode = UITextFieldViewModeAlways;
    _mTextField.delegate = (id <UITextFieldDelegate>) self;
    
    [self.mTlBar addSubview:_mTextField];
    
}

- (void)handleKeyboard {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
}

-(void)showDialog:(NSString *)str
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"这是一个对话框" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    [alert release];
}

-(void) clickLeftButton
{
    [self showDialog:@"点击了导航栏左边按钮"];
}

-(void) clickRightButton
{
    [self showDialog:@"点击了导航栏右边按钮"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mTbView release];
    [_mTlBar release];
    [_mData release];
    [_navBar release];
    [super dealloc];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

   
    static NSString *LeftCellIdentifier = @"LeftCell";
    static NSString *RightCellIdentifier = @"RightCell";
    
    UITableViewCell *cell = nil ;
    
    NSDictionary *data = [self.mData objectAtIndex:(NSUInteger) indexPath.row];
    
    if([[data valueForKey:@"type"] isEqualToString:@"dev_reply"])
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:LeftCellIdentifier];
        
        UIImage *image = [UIImage imageNamed:@"first"];
        cell.imageView.image = image;
    }
    else
    {
        cell = [[RightTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:RightCellIdentifier];
        UIImage *image = [UIImage imageNamed:@"second"];
        cell.imageView.image = image;
    }
    
    cell.textLabel.text = [data valueForKey:@"content"];
    
    cell.detailTextLabel.text =[data valueForKey:@"datetime"];
    
    //隔行换色
    if ([indexPath row] % 2 == 0) {
        cell.backgroundColor = [UIColor lightGrayColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
	return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self mData] count];
}

- (void)didTapAnywhere:(UITapGestureRecognizer *)recognizer {
    [self.mTextField resignFirstResponder];
}

#pragma mark keyboard notification

- (void)keyboardWillShow:(NSNotification *)notification {
    
    float animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat keyboardHeight = [[[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue].size.height;
    
    [UIView animateWithDuration:animationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         CGRect toolbarFrame = self.mTlBar.frame;
                         toolbarFrame.origin.y = self.view.bounds.size.height - keyboardHeight - toolbarFrame.size.height;
                         self.mTlBar.frame = toolbarFrame;
                         
                         CGRect tableViewFrame = self.mTbView.frame;
                         tableViewFrame.size.height = self.view.bounds.size.height - _navBar.frame.size.height - keyboardHeight - self.mTlBar.frame.size.height;
                         /*
                         NSLog(@"self.view.bounds.size.height is %f",self.view.bounds.size.height);
                         NSLog(@"tableViewFrame.size.height 's height is %f",tableViewFrame.size.height);
                         NSLog(@"self.navigationController.navigationBar.frame.size.height is %f",self.navigationController.navigationBar.frame.size.height);
                         NSLog(@"self.mTlBar.frame.size.height is %f",self.mTlBar.frame.size.height);
                         
                         NSLog(@"navBar.frame.size.height is %f",_navBar.frame.size.height);
                         */
                         
                         self.mTbView.frame = tableViewFrame;
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    float animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView beginAnimations:@"bottomBarDown" context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGRect toolbarFrame = self.mTlBar.frame;
    toolbarFrame.origin.y = self.view.bounds.size.height - toolbarFrame.size.height - self.tabBarController.tabBar.frame.size.height;
    self.mTlBar.frame = toolbarFrame;
    
    CGRect tableViewFrame = self.mTbView.frame;
    tableViewFrame.size.height = self.view.bounds.size.height - self.tabBarController.tabBar.frame.size.height
                                - _navBar.frame.size.height- toolbarFrame.size.height;
    self.mTbView.frame = tableViewFrame;
    
    NSLog(@"tableViewFrame.size.height 's height is %f",tableViewFrame.size.height);
    
    
    [UIView commitAnimations];
    
    [self.view removeGestureRecognizer:tapRecognizer];
}

- (void)backToPrevious {
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)sendFeedback:(id)sender {
    if ([self.mTextField.text length]) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:self.mTextField.text forKey:@"content"];
        
        
        [self.mTextField resignFirstResponder];
        //_shouldScrollToBottom = YES;
    }
}



-(void) viewDidAppear:(BOOL)animated
{
    NSString* page = @"Feedback";
    [MTA trackPageViewBegin:page];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSString* page = @"Feedback";
    [MTA trackPageViewEnd:page];
}


@end
