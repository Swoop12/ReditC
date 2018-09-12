//
//  TRASubreddit.m
//  ReditC2.0
//
//  Created by DevMountain on 9/12/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "TRASubreddit.h"

@implementation TRASubreddit

-(instancetype)initWithDictionary:(NSDictionary *)postDictionary{
    
    //Step 1) Pull all the values out of the Json Dictionary
    NSString *title = postDictionary[@"data"][@"title"];
    NSNumber *likeCount = postDictionary[@"data"][@"ups"];
    NSNumber *commentCount = postDictionary[@"data"][@"num_comments"];
    NSString *imageURLString = postDictionary[@"data"][@"thumbnail"];
    
    //Step 1.5) & make sure they are the expected type
    if (![title isKindOfClass:[NSString class]] || !(title) || ![likeCount isKindOfClass:[NSNumber class]] || ![commentCount isKindOfClass:[NSNumber class]]){
        return nil;
    }
    
    //Step 2) Initialize a Model Object from the values you pulled out of the json dictionary.
    self = [super init];
    if (self){
        _title = title;
        _likeCount = likeCount;
        _commentCount = commentCount;
        _imageUrlString = imageURLString;
    }
    return self;
}

@end
