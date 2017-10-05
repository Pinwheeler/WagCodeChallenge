//
//  User.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "User.h"
#import "BadgeCount.h"

@implementation User

NSString *badgeCountKey = @"badge_counts";
NSString *usernameKey = @"display_name";
NSString *avatarKey = @"profile_image";

- (instancetype)initWithJSON:(NSDictionary *)json {
    if (self = [super init]) {
        self.username = json[usernameKey];
        self.badges = [[BadgeCount alloc] initWithJSON:json[badgeCountKey]];
        self.avatarURL = [NSURL URLWithString:json[avatarKey]];
        return self;
    }
    return nil;
}

- (NSMutableAttributedString *)badgeDisplayString {
    return [self.badges badgeDisplayString];
}

@end
