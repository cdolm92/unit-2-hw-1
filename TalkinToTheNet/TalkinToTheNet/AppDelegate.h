//
//  AppDelegate.h
//  TalkinToTheNet
//
//  Created by Michael Kavouras on 9/20/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate> {

    AVAudioPlayer *nycMusic;
}

@property (strong, nonatomic) UIWindow *window;


@end

