//
//  HTTPClient.h
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSPromise.h"

@interface HTTPClient : NSObject

- (KSPromise <NSDictionary *> *)JSONDictionaryGETRequest:(NSURL *)url;
- (KSPromise <NSArray *> *)JSONArrayGETRequest:(NSURL *)url;

@end
