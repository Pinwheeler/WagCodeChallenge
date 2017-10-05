//
//  DIContainer.h
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HTTPClient;
@class UserService;

@protocol HasHTTPClient
@property (readonly) HTTPClient *httpClient;
@end

@interface DIContainer : NSObject <HasHTTPClient>

@end
