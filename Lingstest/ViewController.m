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
FIRDatabaseReference *rootRef;
FIRDatabaseReference *conditionRef;


- (void)viewDidLoad {
    [super viewDidLoad];
    rootRef= [[FIRDatabase database] reference];
    //写入数据库。@"userprofile"是第一个 child ref.
//    NSDictionary *newUserProfileInfo = @{@"username": @"Ling", @"email": @"ling@gmail.com"};
//    FIRDatabaseReference *userProfileRef = [ref child:@"userprofile"].childByAutoId;
//    [userProfileRef setValue:newUserProfileInfo];
}


-(void)viewDidAppear:(BOOL)animated{
//This block will be called anytime new data is added to our database reference, and we don't need to write any extra code to make this happen.
    conditionRef = [rootRef child:@"condition"];
    [conditionRef observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"$$$$$$$$$$$$$$$$$$$$$$$$$%@",[snapshot.value description]);
        _label.text = [snapshot.value description];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//buton.titleLabel.text grab's the text on that button
- (IBAction)changeLabelToSunny:(UIButton *)sender {
    [conditionRef setValue:sender.titleLabel.text withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        if (error) {
            NSLog(@"Data could not be saved.");
        } else {
            NSLog(@"Data saved successfully.");
        }
    }];

    
}


@end
