//
//  NYCLandmarkVenue.m
//  TalkinToTheNet
//
//  Created by Christella on 9/26/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "NYCLandmarkVenue.h"

@implementation NYCLandmarkVenue

- (instancetype)initWithJSON:(NSDictionary *)json {
    
    if (self = [super init]) {
        
        self.venueName = json[@"venues"][@"name"];
                          
        self.venueAddress = json[@"venues"][@"formattedAddress"];
        //        self.commentCount = [[[json objectForKey:@"comments"] objectForKey:@"count"] integerValue];
        self.categoryName = json[@"categories"][@"name"];
        self.checkinsCount = [json[@"stats"][@"checkinsCount"]integerValue];
        self.tipCount = [json[@"stats"][@"tipCount"]integerValue];
        self.herenowCount = [json[@"hereNow"][@"count"]integerValue];
        
        return self;
    }
    return nil;
}



@end
