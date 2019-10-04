//
//  TKTestBase.m
//  TKTestBase
//
//  Created by zhengxianda on 2019/7/16.
//  Copyright © 2019 Toki. All rights reserved.
//

#import "TKTestBase.h"

@implementation TKTestBase

- (void)setUp {
    if ([[self class] isEqual:[TKTestBase class]]) {
        return;
    }
    NSBundle *testBundle = [NSBundle bundleForClass:[TKTestBase class]];
    NSString *classnName = NSStringFromClass([self class]);
    
    NSString *sourceSign = @"Source";
    NSString *targetSign = @"Target";
    
    NSString *sourcePath = [testBundle pathForResource:[classnName stringByAppendingString:sourceSign]
                                                ofType:@"test"];
    NSString *targetPath = [testBundle pathForResource:[classnName stringByAppendingString:targetSign]
                                                ofType:@"test"];
    
    NSAssert(sourcePath.length > 0, @"%@来源文件路径错误", classnName);
    NSAssert(targetPath.length > 0, @"%@结果文件路径错误", classnName);
    
    NSFileManager* fm = [NSFileManager defaultManager];
    NSData *sourceData = [fm contentsAtPath:sourcePath];
    NSData *targetData = [fm contentsAtPath:targetPath];
    
    NSAssert(sourceData != nil, @"%@来源文件获取失败", classnName);
    NSAssert(targetData != nil, @"%@结果文件获取失败", classnName);
    
    NSString *sourceDataString = [[NSString alloc] initWithData:sourceData encoding:NSUTF8StringEncoding];
    self.sourceLines = [[sourceDataString componentsSeparatedByString:@"\n"] mutableCopy];
    
    NSString *targetDataString = [[NSString alloc] initWithData:targetData encoding:NSUTF8StringEncoding];
    self.targetLines = [[targetDataString componentsSeparatedByString:@"\n"] mutableCopy];
    self.resultLines = [NSMutableArray array];
}

- (void)tearDown {
    for (NSInteger i = 0; i < self.resultLines.count; i ++) {
        NSAssert([self.resultLines[i] isEqualToString:self.targetLines[i]],
                 @"\n [%@] \n %@ \n %@ \n",
                 @(i+1),
                 [self.resultLines subarrayWithRange:NSMakeRange(MAX(0, i - 3), MIN(self.resultLines.count - i, 6))],
                 [self.targetLines subarrayWithRange:NSMakeRange(MAX(0, i - 3), MIN(self.targetLines.count - i, 6))]);
    }
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct targets.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
