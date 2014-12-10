//
//  UserLocationViewController.h
//  SendTopic
//
//  Created by iwind on 14-12-10.
//  Copyright (c) 2014年 iwind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface UserLocationViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;


@end
