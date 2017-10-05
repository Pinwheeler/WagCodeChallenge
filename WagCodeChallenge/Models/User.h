//
//  User.h
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KSPromise.h"

@class BadgeCount;

@interface User : NSObject

@property NSString *username;
@property BadgeCount *badges;
@property NSURL *avatarURL;

- (instancetype)initWithJSON:(NSDictionary *)json;
- (NSMutableAttributedString *)badgeDisplayString;

@end
