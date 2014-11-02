//
//  PersonalSidebarSub.m
//  ManualFBLogin
//
//  Created by Hillary Do on 11/1/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "PersonalSidebarSub.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation PersonalSidebarSub

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _loadData];
    
}
- (void)_loadData {
    // ...
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // result is a dictionary with the user's Facebook data
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:pictureURL];
            
            // Run network request asynchronously
            [NSURLConnection sendAsynchronousRequest:urlRequest
                                               queue:[NSOperationQueue mainQueue]
                                   completionHandler:
             ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                 if (connectionError == nil && data != nil) {
                     // Set the image in the header imageView
                     self.ProfilePicture.image = [UIImage imageWithData:data];
                 }
             }];
        }
    }];
}


@end
