//
//  MWFeedParser+block.h
//  Macnews
//
//  Created by mtjddnr on 2016. 8. 3..
//  Copyright © 2016년 kr.smoon. All rights reserved.
//

#import "MWFeedParser.h"

@interface MWFeedParser (block)
@property (nonatomic, copy) void (^onStart)(MWFeedParser *parser);
@property (nonatomic, copy) void (^onFeedInfo)(MWFeedParser *parser, MWFeedInfo *info);
@property (nonatomic, copy) void (^onFeedItem)(MWFeedParser *parser, MWFeedItem *item);
@property (nonatomic, copy) void (^onFinish)(MWFeedParser *parser);
@property (nonatomic, copy) void (^onFail)(MWFeedParser *parser, NSError *error);

@end
