//
//  FBViewController.m
//  MyLocations
//
//  Created by Luke Carelsen on 2013/07/09.
//  Copyright (c) 2013 Luke Carelsen. All rights reserved.
//

#import "LukesFBViewController.h"

@interface LukesFBViewController ()

@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;


@end

@implementation LukesFBViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.userProfileImage.profileID = user.id;
        if (FBSession.activeSession.isOpen) {
            // [self populateUserDetails];
            NSLog(@"open");
        }
    }
    
    return self;
}

- (void)populateUserDetails {
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
             if (!error) {
                 //self.userNameLabel.text = user.name;
                 self.userProfileImage.profileID = [user objectForKey:@"id"];
             }
         }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (FBSession.activeSession.isOpen) {
        [self populateUserDetails];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
