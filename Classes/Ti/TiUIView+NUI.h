#import "TiBase.h"
#import "TiUIView.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NUIRenderer.h"

@interface TiUIView (NUI)

@property (nonatomic, retain) NSString* nuiClass;
@property (nonatomic, retain) NSNumber* nuiIsApplied;

- (void)applyNUI;

@end
