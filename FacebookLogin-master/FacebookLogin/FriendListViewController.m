//
//  FriendListViewController.m
//  FacebookLogin
//
//  Created by SDT-1 on 2014. 1. 21..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "FriendListViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Foundation/Foundation.h>


@interface FriendListViewController ()<UITableViewDelegate, UITableViewDataSource, FBLoginViewDelegate>
@property (strong, nonatomic) NSArray *friends;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation FriendListViewController

-(void)showFriendList{
    if (FBSession.activeSession.isOpen)
    {
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            NSLog(@"%@", [result objectForKey:@"gender"]);
            NSLog(@"%@", [result objectForKey:@"hometown"]);
            NSLog(@"%@", [result objectForKey:@"birthday"]);
            NSLog(@"%@", [result objectForKey:@"email"]);
        }];
        
    }
    /* FBRequest* friendsRequest = [FBRequest requestForMyFriends];
    [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection, NSDictionary* result, NSError *error) {
    self.friends = [result objectForKey:@"data"];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.table reloadData];
    }];
    }]; */
    }


/*
-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    [self showFriendList];
    NSLog(@"Your message here");
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.friends = nil;
    [self showFriendList];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.friends count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FRIEND_CELL"];
    NSDictionary *one = self.friends[indexPath.row];
    cell.textLabel.text = one[@"name"];
    return cell;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
 
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"read_friendlists",@"user_birthday",
                                @"user_hometown",@"user_location",@"email",@"basic_info"]];

    // Align the button in the center horizontally
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
    loginView.delegate = self;
    
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
