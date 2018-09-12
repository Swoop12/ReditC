//
//  TRASubredditClient.h
//  ReditC2.0
//
//  Created by DevMountain on 9/12/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRASubreddit.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRASubredditClient : NSObject

+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void(^)(NSArray<TRASubreddit *> * _Nullable posts))block;
// static func fetchAllSubReddits(for title: String, completion: @escpaing ([Subreddit]?) -> ())

+(void)fetchImageDataForURL:(NSString *)imageUrlString withBlock:(void(^)(NSData * _Nullable imageData))block;
// static func fetchImageData( for url: String, completion: @escaping (Data?) -> ())

@end

NS_ASSUME_NONNULL_END
