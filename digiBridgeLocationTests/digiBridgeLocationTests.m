//
//  digiBridgeLocationTests.m
//  digiBridgeLocation
//
//  Created by Mike Antonelli on 12/22/14.
//  Copyright (c) 2014 Mike Antonelli. All rights reserved.
//

#import <digiBridgeLocation/digiBridgeLocation.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface digiBridgeLocationTests : XCTestCase

@end

@implementation digiBridgeLocationTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testStatics_locationManager_returnsPreconfiguredCLLocationManager
{
    CLLocationManager *locationManager = [digiBridgeLocation locationManager];
    
    XCTAssertNotNil(locationManager.delegate);
    XCTAssertTrue(locationManager.desiredAccuracy == kCLLocationAccuracyBest);
    XCTAssertTrue(locationManager.distanceFilter == kCLLocationAccuracyKilometer);
}

- (void)testStatics_locationManager_returnsSameInstance
{
    CLLocationManager *locationManager = [digiBridgeLocation locationManager];
    
    CLLocationManager *anotherLocationManager = [digiBridgeLocation locationManager];
    
    XCTAssertEqual(locationManager, anotherLocationManager);
}

- (void)testStatics_authorizationStatus_returnsCLLocationManagerAuthorizationStatus
{
    CLAuthorizationStatus libraryStatus = [digiBridgeLocation authorizationStatus];
    CLAuthorizationStatus frameworkStatus = [CLLocationManager authorizationStatus];
    
    XCTAssertTrue(libraryStatus == frameworkStatus);
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
