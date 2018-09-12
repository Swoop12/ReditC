//
//  TRASubreddit.h
//  ReditC2.0
//
//  Created by DevMountain on 9/12/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface TRASubreddit : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) NSNumber *likeCount;
@property (nonatomic, readonly) NSNumber *commentCount;
@property (nonatomic, readonly, copy) NSString *imageUrlString;

@property (nonatomic, readwrite, nullable) UIImage *photo;

-(instancetype)initWithDictionary:(NSDictionary *)postDictionary;

@end

NS_ASSUME_NONNULL_END
