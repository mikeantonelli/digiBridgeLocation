//
//  digiBridgeLocation.h
//  digiBridgeLocation
//
//  Created by Mike Antonelli on 12/22/14.
//  Copyright (c) 2014 Mike Antonelli. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface digiBridgeLocation : NSObject

/**
 *  Retrieve the user's current location.
 *
 *  @return CLLocation representing the user's current location.
 */
+ (CLLocation *)currentLocation;

/**
 *  Retreive a pre-configured CLLocationManager.
 *
 *  @return CLLocationManager.
 */
+ (CLLocationManager *)locationManager;

/**
 *  Retrieve the current Core Location Authorization status.
 *  This informs you as to whether the user has already approved/denied access to location services.
 *
 *  @return CLAuthorizationStatus.
 */
+ (CLAuthorizationStatus)authorizationStatus;

/**
 *  Request access to the user's location data.
 *
 *  @param authorizationStatus The scope of location data you are interested in accessing.
 *  @param success             The block to execute if your request succeeds.
 *  @param failure             The block to execute if your request fails.
 */
+ (void)requestAuthorizationStatus:(CLAuthorizationStatus)authorizationStatus
                           success:(void(^)(CLAuthorizationStatus status))success
                           failure:(void(^)(CLAuthorizationStatus status))failure;

/**
 *  Present the user a modal view controller which informs them how to enable location services
 *  if they were previously denied. Optionally, open the Settings app directly by setting
 *  openSettingsApp to YES.
 *
 *  @param status          The status to display the message for, currently doesn't do anything.
 *  @param controller      The controller to present the modal action from.
 *  @param openSettingsApp Whether or not to open the Settings app directly.
 */
+ (void)displayAuthorizationStatusMessage:(CLAuthorizationStatus)status
                               controller:(UIViewController *)controller
                          openSettingsApp:(BOOL)openSettingsApp;

@end
