//
//  ViewController.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "ViewController.h"
#import "DIContainer.h"
#import "UserService.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import <UIKit/UIKit.h>


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property UserService *userService;
@property NSArray<User *> *users;
@property UIImage *placeholderImage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *loadingScreen;

@end

@implementation ViewController

NSString *userCellIdentifier = @"UserCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    DIContainer *dependencies = [[DIContainer alloc] init]; // This should be the only place where this is initialized --- see README
    self.userService = dependencies.userService;
    self.placeholderImage = [UIImage imageNamed:@"placeholder"];
    [[self.userService fetchUsers] then:^id _Nullable(NSArray<User *> * _Nullable value) {
        self.users = value;
        [self.tableView reloadData];
        [UIView animateWithDuration:0.5 animations:^{
            self.loadingScreen.alpha = 0.0;
        }];
        return nil;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDatasource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userCellIdentifier];
    User *user = [self.users objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    [cell.imageView setImageWithURL:user.avatarURL placeholderImage:self.placeholderImage];
    NSMutableAttributedString *badgeString = [user badgeDisplayString];
    cell.detailTextLabel.attributedText = badgeString;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

@end
