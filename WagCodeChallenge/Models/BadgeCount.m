//
//  BadgeCount.m
//  WagCodeChallenge
//
//  Created by Anthony Dreessen on 10/5/17.
//  Copyright © 2017 Anthony Dreessen. All rights reserved.
//

#import "BadgeCount.h"
#import "UIColor+Palette.h"

@implementation BadgeCount

NSString *goldKey = @"gold";
NSString *silverKey = @"silver";
NSString *bronzeKey = @"bronze";

- (instancetype)initWithJSON:(NSDictionary<NSString *,NSNumber *> *)json {
    if (self = [super init]) {
        self.gold = json[goldKey];
        self.silver = json[silverKey];
        self.bronze = json[bronzeKey];
        return self;
    }
    return nil;
}

- (NSMutableAttributedString *)badgeDisplayString {
    
    NSString *goldString = [NSString stringWithFormat:@"● %@ ", self.gold];
    NSString *silverString = [NSString stringWithFormat:@"● %@ ", self.silver];
    NSString *bronzeString = [NSString stringWithFormat:@"● %@", self.bronze];
    
    NSString *comboString = [NSString stringWithFormat:@"%@%@%@", goldString, silverString, bronzeString];
    
    NSMutableAttributedString *finalString = [[NSMutableAttributedString alloc] initWithString:comboString];
    
    [finalString addAttribute:NSForegroundColorAttributeName value:[UIColor goldColor] range:NSMakeRange(0, goldString.length)];
    [finalString addAttribute:NSForegroundColorAttributeName value:[UIColor silverColor] range:NSMakeRange(goldString.length, silverString.length)];
    [finalString addAttribute:NSForegroundColorAttributeName value:[UIColor bronzeColor] range:NSMakeRange((goldString.length + silverString.length), bronzeString.length)];
    
    return finalString;
}
@end
