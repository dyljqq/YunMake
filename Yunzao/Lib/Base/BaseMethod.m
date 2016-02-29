//
//  BaseMethod.m
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import "BaseMethod.h"
#import <CommonCrypto/CommonDigest.h>
#import "Reachability.h"

@implementation BaseMethod

+(BOOL)isStringNotNull:(id)object{
    
    if([object isEqual:[NSNull null]]||[object isEqualToString:@""] || object == nil){
        
        return NO;
    }
    
    return YES;
}

+ (NSString *)getMd5WithString:(NSString *)string
{
    const char * original_str = [string UTF8String];
    unsigned char digist[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (unsigned int)strlen(original_str), digist);
    NSMutableString *outPutStr = [NSMutableString stringWithCapacity:10];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        [outPutStr appendFormat:@"%02x",digist[i]];
        
    }
    return [outPutStr lowercaseString];
}

+ (NSString*)getMd5WithImage:(UIImage*)image{
    unsigned char result[16];
    
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    
    CC_MD5((__bridge const void *)(imageData), [imageData length], result);
    
    NSString *imageHash = [NSString stringWithFormat:
                           @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                           result[0], result[1], result[2], result[3],
                           result[4], result[5], result[6], result[7],
                           result[8], result[9], result[10], result[11],
                           result[12], result[13], result[14], result[15]
                           ];
    return imageHash;
}

+ (BOOL)isConnectionAvailable{
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    if (!isExistenceNetwork) {
        NSLog(@"当前网络不可用，请检查网络连接");
        return NO;
    }
    
    return YES;
}

@end
