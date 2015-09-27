//
//  NYCLandmarkVenueTableViewCell.h
//  TalkinToTheNet
//
//  Created by Christella on 9/26/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYCLandmarkVenueTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *landmarkName;
@property (weak, nonatomic) IBOutlet UILabel *landmarkAddress;
@property (weak, nonatomic) IBOutlet UILabel *landmarkType;
@property (weak, nonatomic) IBOutlet UILabel *checkinCount;
@property (weak, nonatomic) IBOutlet UILabel *tipCount;
@property (weak, nonatomic) IBOutlet UILabel *hereCount;

@end
