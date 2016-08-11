//
//  MWFeedParser+block.m
//  Macnews
//
//  Created by mtjddnr on 2016. 8. 3..
//  Copyright © 2016년 kr.smoon. All rights reserved.
//

#import "MWFeedParser+block.h"
#import <objc/runtime.h>

static void *onStartPropertyKey = &onStartPropertyKey;
static void *onFeedInfoKey = &onFeedInfoKey;
static void *onFeedItemKey = &onFeedItemKey;
static void *onFinishKey = &onFinishKey;
static void *onFailKey = &onFailKey;

@implementation MWFeedParser (block)

- (void)setOnStart:(void (^)(MWFeedParser *))onStart {
    self.delegate = (id <MWFeedParserDelegate>)self;
    objc_setAssociatedObject(self, onStartPropertyKey, onStart, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void (^)(MWFeedParser *))onStart {
    return objc_getAssociatedObject(self, onStartPropertyKey);
}
- (void)setOnFeedInfo:(void (^)(MWFeedParser *, MWFeedInfo *))onFeedInfo {
    self.delegate = (id <MWFeedParserDelegate>)self;
    objc_setAssociatedObject(self, onFeedInfoKey, onFeedInfo, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void (^)(MWFeedParser *, MWFeedInfo *))onFeedInfo {
    return objc_getAssociatedObject(self, onFeedInfoKey);
}
- (void)setOnFeedItem:(void (^)(MWFeedParser *, MWFeedItem *))onFeedItem {
    self.delegate = (id <MWFeedParserDelegate>)self;
    objc_setAssociatedObject(self, onFeedItemKey, onFeedItem, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void (^)(MWFeedParser *, MWFeedItem *))onFeedItem {
    return objc_getAssociatedObject(self, onFeedItemKey);
}
- (void)setOnFinish:(void (^)(MWFeedParser *))onFinish {
    self.delegate = (id <MWFeedParserDelegate>)self;
    objc_setAssociatedObject(self, onFinishKey, onFinish, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void (^)(MWFeedParser *))onFinish {
    return objc_getAssociatedObject(self, onFinishKey);
}
- (void)setOnFail:(void (^)(MWFeedParser *, NSError *))onFail {
    self.delegate = (id <MWFeedParserDelegate>)self;
    objc_setAssociatedObject(self, onFailKey, onFail, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void (^)(MWFeedParser *, NSError *))onFail {
    return objc_getAssociatedObject(self, onFailKey);
}


#pragma mark Delegate
- (void)feedParserDidStart:(MWFeedParser *)parser {
    if (self.onStart) self.onStart(parser);
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)i {
    if (self.onFeedInfo) self.onFeedInfo(parser, i);
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)i {
    if (self.onFeedItem) self.onFeedItem(parser, i);
}
- (void)feedParserDidFinish:(MWFeedParser *)parser {
    if (self.onFinish) self.onFinish(parser);
}
- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
    if (self.onFail) self.onFail(parser, error);
}
@end
