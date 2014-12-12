//
//  UserLocationViewController.m
//  SendTopic
//
//  Created by iwind on 14-12-10.
//  Copyright (c) 2014年 iwind. All rights reserved.
//

#import "UserLocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface UserLocationViewController ()

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;


@end

@implementation UserLocationViewController

- (id)init
{
    self = [super init];
    if (self) {
        if ([CLLocationManager locationServicesEnabled]) {
            self.locationManager = [[CLLocationManager alloc]init];
            self.locationManager.delegate = self;
            self.locationManager.distanceFilter = kCLDistanceFilterNone;
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
                [self.locationManager requestWhenInUseAuthorization];
            }
            [self.locationManager startUpdatingLocation];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    [btn setTitle:@"回传" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview: btn];
    
//    if ([CLLocationManager locationServicesEnabled]) {
//        self.locationManager = [[CLLocationManager alloc]init];
//        self.locationManager.delegate = self;
//        self.locationManager.distanceFilter = kCLDistanceFilterNone;
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
////        [self.locationManager startUpdatingLocation];
//    }
//    [self.locationManager startUpdatingLocation];
    
}

-(void) back{
    self.delegate.latitudeLabel.text= [NSString stringWithFormat:@"%.2f",self.latitude];
    self.delegate.longitudeLabel.text= [NSString stringWithFormat:@"%.2f",self.longitude];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * currentLocation = [locations lastObject];
    CLLocationCoordinate2D coor = currentLocation.coordinate;
    self.latitude = coor.latitude;
    self.longitude = coor.longitude;
    
    
    NSLog(@"~~~~~~~ 纬度 = %.2f 经度 ＝ %.2f",self.latitude,self.longitude);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied) {
        NSLog(@"-------error code = %ld",(long)error.code);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc
{
    [self.locationManager stopUpdatingLocation];
}

@end
