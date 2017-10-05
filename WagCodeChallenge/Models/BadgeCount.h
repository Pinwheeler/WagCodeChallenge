//
//  BadgeCount.h
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BadgeCount : NSObject

@property NSNumber *gold;
@property NSNumber *silver;
@property NSNumber *bronze;

- (instancetype)initWithJSON:(NSDictionary<NSString *, NSNumber *> *)json;

@end
