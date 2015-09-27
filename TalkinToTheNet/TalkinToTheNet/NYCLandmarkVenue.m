//
//  NYCLandmarkVenue.m
//  TalkinToTheNet
//
//  Created by Christella on 9/26/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "NYCLandmarkVenue.h"

@implementation NYCLandmarkVenue

- (instancetype)initWithJSON:(NSDictionary *)venue {
    
    if (self = [super init]) {
        
        self.venueName = venue[@"name"];
                          
       
        
        
        self.venueAddress = [venue[@"location"][@"formattedAddress"] componentsJoinedByString:@" "];
        NSDictionary *venueType = [venue[@"categories"]objectAtIndex:0];
        
        self.categoryName = [venueType objectForKey:@"name"];
       
        // NSLog(@"%@", venueType);
       
        self.checkinsCount = [venue[@"stats"][@"checkinsCount"]integerValue];
        self.tipCount = [venue[@"stats"][@"tipCount"]integerValue];
        self.herenowCount = [venue[@"hereNow"][@"count"]integerValue];
        
        return self;
    }
    return nil;
}



@end
