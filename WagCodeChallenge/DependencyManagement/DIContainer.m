//
//  DIContainer.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "DIContainer.h"
#import "HTTPClient.h"

@interface DIContainer ()
@property HTTPClient *httpClient;
@end

@implementation DIContainer

-(instancetype) init {
    if (self = [super init]) {
        self.httpClient = [[HTTPClient alloc] init];
        return self;
    }
    return nil;
}

@end
