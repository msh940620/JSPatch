//
//  JSPatchHelper.m
//  Pods
//
//  Created by Reminisce on 2016/11/8.
//
//

#import "JSPatchHelper.h"
#import <JSPatchPlatform/JSPatch.h>
@implementation JSPatchHelper

#pragma mark --jspatch
+(void)startJSPatch{
    [JSPatch startWithAppKey:JS_PUSH_KEY];
#ifdef DEBUG
    [JSPatch setupDevelopment];
#endif
    [JSPatch sync];
    
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        switch (type) {
            case JPCallbackTypeUpdate: {
                NSLog(@"updated %@ %@", data, error);
                break;
            }
            case JPCallbackTypeRunScript: {
                NSLog(@"run script %@ %@", data, error);
                break;
            }
            default:
                break;
        }
    }];
}

@end
