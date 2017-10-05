//
//  UserService.h
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DIContainer.h"
#import "KSPromise.h"

@class User;

@interface UserService : NSObject

- (instancetype)initWithDependencies:(id<HasHTTPClient>)dependencies;

- (KSPromise<NSArray<User *> *> *)fetchUsers;

@end
