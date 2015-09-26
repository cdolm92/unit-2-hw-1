//
//  NYCLandmarkVenue.h
//  TalkinToTheNet
//
//  Created by Christella on 9/26/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYCLandmarkVenue : NSObject

@property (nonatomic) NSString *venueName;
@property (nonatomic) NSString *venueAddress;
@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSInteger checkinsCount;
@property (nonatomic) NSInteger tipCount;
@property (nonatomic) NSInteger herenowCount;

- (instancetype)initWithJSON:(NSDictionary *)json;


@end
