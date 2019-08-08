//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import <Quartz/Quartz.h>

@interface ___FILEBASENAME___ () <QLPreviewingController>
    
@end

@implementation PreviewViewController

- (NSString *)nibName {
    return @"___FILEBASENAME___";
}

- (void)loadView {
    [super loadView];
    // Do any additional setup after loading the view.
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(NSString *)identifier queryString:(NSString *)queryString completionHandler:(void (^)(NSError * _Nullable))handler {
    
    // Perform any setup necessary in order to prepare the view.
    
    // Call the completion handler so Quick Look knows that the preview is fully loaded.
    // Quick Look will display a loading spinner while the completion handler is not called.

    handler(nil);
}

@end

