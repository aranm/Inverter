//
//  IOCContainer.h
//  IOCContainer
//
//  Created by Aran Mulholland on 7/08/11.
//  Copyright 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOCContainer : NSObject {
    NSMutableDictionary *typeDictionary;
}

-(bool)registerType:(Class)classType forProtocol:(Protocol *)protocolType;
-(id)resolve:(Protocol *)protocolType;

@end
