//
//  IOCContainer.m
//  IOCContainer
//
//  Created by Aran Mulholland on 7/08/11.
//  Copyright 2011 None. All rights reserved.
//

#import "IOCContainer.h"
#import <objc/message.h>

@implementation IOCContainer

- (id)init
{
    self = [super init];
    if (self) {
        typeDictionary = [[NSMutableDictionary alloc]init];
        // Initialization code here.
    }
    
    return self;
}

-(bool)registerType:(Class)classType forProtocol:(Protocol *)protocolType{
    bool typeRegistered = NO;
    if ([classType conformsToProtocol:protocolType]){
        [typeDictionary setObject:classType forKey:[NSString stringWithCString:protocol_getName(protocolType) encoding:NSStringEncodingConversionAllowLossy]];
        typeRegistered = YES;
    }
    return typeRegistered;
}

-(id)resolve:(Protocol *)protocolType{
    id instantiatedObject = nil;
    
    Class classToInstantiate = [typeDictionary objectForKey:[NSString stringWithCString:protocol_getName(protocolType) encoding:NSStringEncodingConversionAllowLossy]];
    if (classToInstantiate == nil) { }
    else{
        //TODO: Should find the correct constructor
        instantiatedObject = [[[classToInstantiate class] alloc]init];
    }
    
    return instantiatedObject;
}

@end
