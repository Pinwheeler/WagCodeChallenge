//
//  HTTPClient.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "HTTPClient.h"
#import "AFNetworking.h"
#import "Constants.h"

@interface HTTPClient ()

@property AFURLSessionManager *manager;

@end

@implementation HTTPClient

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        return self;
    }
    return nil;
}

- (KSPromise<NSDictionary *> *)JSONDictionaryGETRequest:(NSURL *)url {
    return [[self GETRequest:url] then:^id _Nullable(id  _Nullable value) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            return value;
        } else {
            return [NSError errorWithDomain:NetworkingErrorDomain code:0 userInfo:@{@"Reason": @"Expected responseObject to be an NSDictionary"}];
        }
    }];
}

- (KSPromise<NSArray *> *)JSONArrayGETRequest:(NSURL *)url {
    return [[self GETRequest:url] then:^id _Nullable(id  _Nullable value) {
        if ([value isKindOfClass:[NSArray class]]) {
            return value;
        } else {
            return [NSError errorWithDomain:NetworkingErrorDomain code:0 userInfo:@{@"Reason": @"Expected responseObject to be an NSArray"}];
        }
    }];
}

- (KSPromise <id> * _Nonnull)GETRequest:(NSURL * _Nonnull)url {
    return [KSPromise promise:^(resolveType  _Nonnull resolve, rejectType  _Nonnull reject) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                reject(error);
                NSLog(@"Error: %@", error);
            } else {
                resolve(responseObject);
            }
        }];
        [dataTask resume];
    }];
}

@end
