//
//  UserService.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "UserService.h"
#import "HTTPClient.h"
#import "User.h"

@interface UserService ()
@property HTTPClient *httpClient;
@end

@implementation UserService

NSString *usersEndpoint = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";
NSString *userArrayKey = @"items";

- (instancetype)initWithDependencies:(id<HasHTTPClient>)dependencies {
    if (self = [super init]) {
        self.httpClient = dependencies.httpClient;
        return self;
    }
    return nil;
}

- (KSPromise<NSArray<User *> *> *)fetchUsers {
    return [[self.httpClient JSONDictionaryGETRequest:[NSURL URLWithString:usersEndpoint]] then:^id _Nullable(NSDictionary * _Nullable value) {
        NSArray<NSDictionary *> *userJSONs = value[userArrayKey];
        NSMutableArray<User *> *users = [NSMutableArray arrayWithCapacity:userJSONs.count];
        for (NSDictionary *json in userJSONs) {
            User *user = [[User alloc] initWithJSON:json];
            [users addObject:user];
        }
        return users;
    }];
}

@end
