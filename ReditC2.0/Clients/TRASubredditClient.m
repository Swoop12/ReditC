//
//  TRASubredditClient.m
//  ReditC2.0
//
//  Created by DevMountain on 9/12/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "TRASubredditClient.h"

@implementation TRASubredditClient

// static func fetchAllSubReddits(for title: String, completion: @escpaing ([Subreddit]?) -> ())
+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void(^)(NSArray<TRASubreddit *> * _Nullable posts))block{
    
    //1) Contruct you URL
    NSURL *baseUrl = [NSURL URLWithString:@"https://www.reddit.com/r/"];
    NSURL *url = [baseUrl URLByAppendingPathComponent:title];
    url = [url URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", [url absoluteString]);
    
    //2) DataTask, Seralizing JSON, and completing, and resume
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error fetching all subreddits for the tittle %@ %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"No Data Returned");
            block(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error: &error];
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        NSMutableArray *subreddits = [[NSMutableArray alloc] init];
        for (NSDictionary *postDictionary in childrenArray){
            TRASubreddit *post = [[TRASubreddit alloc] initWithDictionary:postDictionary];
            [subreddits addObject:post];
        }
        block(subreddits);
    }] resume];
}

// static func fetchImageData( for url: String, completion: @escaping (Data?) -> ())
+(void)fetchImageDataForURL:(NSString *)imageUrlString withBlock:(void(^)(NSData * _Nullable imageData))block{
    
    //1) Construct the URL
    NSURL *url = [NSURL URLWithString:imageUrlString];
//    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:@"sol" value:@"45"];
//    NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"al;ksdjf;ayetpqijag;alksjdf76"];
//    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:true];
//    components.queryItems = [[NSArray alloc] initWithObjects:queryItem, queryItem2, nil];
//    NSURL *urlWithQueryItems = components.URL;
    
//https://Whatever.com?sol=45&api_key=al;ksdjf;ayetpqijag;alksjdf76
    
    NSLog(@"%@", [url absoluteString]);
    
    //2)DataTask, Serialize, Complete and Resume
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error fetching image %@ %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@",response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        block(data);
    }] resume];
}


@end
