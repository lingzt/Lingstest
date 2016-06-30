//
//  ViewController.m
//  Lingstest
//
//  Created by ling toby on 6/29/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ViewController.h"
@import Firebase;
@import FirebaseDatabase;

@interface ViewController ()


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *newUserProfileInfo = @{@"username": @"Ling", @"email": @"ling@gmail.com"};
    FIRDatabaseReference *ref = [[FIRDatabase database] reference];
    FIRDatabaseReference *userProfileRef = [ref child:@"userprofile"].childByAutoId;
    [userProfileRef setValue:newUserProfileInfo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
