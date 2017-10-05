//
//  DIContainer.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "DIContainer.h"
#import "HTTPClient.h"
#import "UserService.h"

@interface DIContainer ()
@property HTTPClient *httpClient;
@property UserService *userService;
@end

@implementation DIContainer

-(instancetype) init {
    if (self = [super init]) {
        self.httpClient = [[HTTPClient alloc] init];
        self.userService = [[UserService alloc] initWithDependencies:self];
        return self;
    }
    return nil;
}

@end
