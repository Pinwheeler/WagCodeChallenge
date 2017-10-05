//
//  UserService.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "UserService.h"

@interface UserService ()
@property HTTPClient *httpClient;
@end

@implementation UserService

- (instancetype)initWithDependencies:(id<HasHTTPClient>)dependencies {
    if (self = [super init]) {
        self.httpClient = dependencies.httpClient;
        return self;
    }
    return nil;
}

@end
