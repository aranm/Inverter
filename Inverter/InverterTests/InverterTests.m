//
//  InverterTests.m
//  InverterTests
//
//  Created by Aran Mulholland on 7/08/11.
//  Copyright 2011 None. All rights reserved.
//

#import "InverterTests.h"
#import "IOCContainer.h"
#import "TestProtocol.h"
#import "TestClass.h"

@implementation InverterTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testContainerCanRegisterType {
    
    IOCContainer *iocContainer = [[IOCContainer alloc]init];
    STAssertTrue([iocContainer registerType:[TestClass class] forProtocol:@protocol(TestProtocol)], @"Container accepts registration");
}

- (void)testContainerCanInstantiateType {
    
    IOCContainer *iocContainer = [[IOCContainer alloc]init];
    [iocContainer registerType:[TestClass class] forProtocol:@protocol(TestProtocol)];
    
    id testObject = [iocContainer resolve:@protocol(TestProtocol)]; 
    STAssertTrue(([testObject class] == [TestClass class]), @"Container returns instantiated class TestClass for TestProtocol");
}


@end
