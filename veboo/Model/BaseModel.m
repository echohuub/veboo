//
//  BaseModel.m
//  veboo
//
//  Created by HeQingbao on 13-11-30.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)initWithDataDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self setAttributes:dictionary];
    }
    return self;
}

- (void)setAttributes:(NSDictionary *)dictionary
{
    NSDictionary *attrMapDic = [self attributesMapDictionary];
    NSEnumerator *enumerator = [attrMapDic keyEnumerator];
    id jsonAttrName;
    while (jsonAttrName = [enumerator nextObject]) {
        NSString *attrName = [attrMapDic objectForKey:jsonAttrName];
        SEL setter = [self getSetterSELWithAttributeName:attrName];
        if ([self respondsToSelector:setter]) {
            NSObject *obj = [dictionary objectForKey:jsonAttrName];
            [self performSelectorOnMainThread:setter withObject:obj waitUntilDone:[NSThread isMainThread]];
        }
    }
}

- (NSDictionary *)attributesMapDictionary{
    return [NSDictionary dictionary];
}

- (SEL)getSetterSELWithAttributeName:(NSString *)attribute
{
    NSString *capital = [[attribute substringToIndex:1] uppercaseString];
    NSString *setterMethodName = [NSString stringWithFormat:@"set%@%@:", capital, [attribute substringFromIndex:1]];
    return NSSelectorFromString(setterMethodName);
}

@end
