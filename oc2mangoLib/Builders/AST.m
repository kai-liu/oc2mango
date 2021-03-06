//
//  AST.m
//  oc2mangoLib
//
//  Created by Jiang on 2019/5/18.
//  Copyright © 2019年 SilverFruity. All rights reserved.
//

#import "AST.h"
#import "MakeDeclare.h"
@implementation AST
- (ORClass *)classForName:(NSString *)className{
    ORClass *class = self.classCache[className];
    if (!class) {
        class = makeOCClass(className);
        self.classCache[className] = class;
    }
    return class;
}
- (instancetype)init
{
    self = [super init];
    self.classCache = [NSMutableDictionary dictionary];
    self.globalStatements = [NSMutableArray array];
    return self;
}
- (void)addGlobalStatements:(id)objects{
    if ([objects isKindOfClass:[NSArray class]]) {
        [self.globalStatements addObjectsFromArray:objects];
    }else{
        [self.globalStatements addObject:objects];
    }
}
@end

