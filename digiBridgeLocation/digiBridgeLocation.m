//
//  digiBridgeLocation.m
//  digiBridgeLocation
//
//  Created by Mike Antonelli on 12/22/14.
//
//

#import "digiBridgeLocation.h"

@interface digiBridgeLocation () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, copy) void (^successBlock)(CLAuthorizationStatus);

@property (nonatomic, copy) void (^failureBlock)(CLAuthorizationStatus);

@end

@implementation digiBridgeLocation

#pragma mark - Public

#pragma mark Static

+ (CLLocation *)currentLocation
{
    return [[[self.class sharedClient] locationManager] location];
}

+ (CLLocationManager *)locationManager
{
    return [[self.class sharedClient] locationManager];
}

+ (CLAuthorizationStatus)authorizationStatus
{
    return [CLLocationManager authorizationStatus];
}

+ (void)requestAuthorizationStatus:(CLAuthorizationStatus)authorizationStatus
                           success:(void(^)(CLAuthorizationStatus status))success
                           failure:(void(^)(CLAuthorizationStatus status))failure
{
    if ([self authorizationStatus] == authorizationStatus) // we've already got what you're looking for
    {
        if (success)
        {
            success(authorizationStatus);
        }
        return;
    }
    
    // We should move this, so the blocks are not held on to when a bad authorizationStatus is sent.
    [[self.class sharedClient] setSuccessBlock:success];
    [[self.class sharedClient] setFailureBlock:failure];
    
    switch (authorizationStatus)
    {
        case kCLAuthorizationStatusAuthorizedAlways:
            [[self.class locationManager] requestAlwaysAuthorization];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [[self.class locationManager] requestWhenInUseAuthorization];
            break;
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
            // TODO: Add log message telling the client we suppresed the request because who
            // the hell would ask for this kind of an authorization status...
        default:
            break;
    }
}

#pragma mark Instance

- (instancetype)init
{
    @throw @"digiBridgeLocation is not meant to be initialized";
}

#pragma mark

#pragma mark - Private

#pragma mark Static

+ (instancetype)sharedClient
{
    static dispatch_once_t p = 0;
    
    __strong static id _sharedInstance = nil;
    
    dispatch_once(&p, ^{
        _sharedInstance = [[self alloc] _init];
    });
    
    return _sharedInstance;
}

#pragma mark

#pragma mark Instance

- (instancetype)_init
{
    return [super init];
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager)
    {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = kCLLocationAccuracyKilometer;
    }
    
    return _locationManager;
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status)
    {
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusNotDetermined:
        {
            if (self.failureBlock)
                self.failureBlock(status);
            
            if (status != kCLAuthorizationStatusNotDetermined)
                [self clearBlocks];
            
            break;
        }
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            if (self.successBlock)
                self.successBlock(status);
            
            [self clearBlocks];
            
            break;
        }
        default:
            break;
    }
}

- (void)clearBlocks
{
    self.successBlock = nil;
    self.failureBlock = nil;
}

@end
