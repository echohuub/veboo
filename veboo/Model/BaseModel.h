//
//  BaseModel.h
//  veboo
//
//  Created by HeQingbao on 13-11-30.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (id)initWithDataDictionary:(NSDictionary *)dictionary;
- (void)setAttributes:(NSDictionary *)dictionary;
- (NSDictionary *)attributesMapDictionary;

@end
