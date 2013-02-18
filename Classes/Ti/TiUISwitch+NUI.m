//
//  UISwitch+NUI.m
//  NappNUI
//
//  Created by Mads Møller 
//  Copyright (c) 2013 Napp. All rights reserved.
//

#import "TiUISwitch+NUI.h"

@implementation TiUISwitch (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        NSLog(@"Init nuiClass TiUISwitch");
        self.nuiClass = @"Switch";
    }
}

-(UISwitch*)switchView
{
	if (switchView==nil)
	{
        switchView = [[UISwitch alloc] init];
		[switchView addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
		[self addSubview:switchView];
	}
	return switchView;
}

- (void)applyNUI
{
    // Styling shouldn't be applied to inherited classes
    NSLog(@"applyNUI TiUISwitch %@",[self class]);
    if ([self class] == [TiUISwitch class]) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:@"none"]) {
            if ([self class] == [TiUISwitch class]) {
                [NUIRenderer renderSwitch:[self switchView] withClass:self.nuiClass];
            }
        }
    }
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)setNuiClass_:(id)value {
    //self.nuiClass = [TiUtils stringValue:value];
    objc_setAssociatedObject(self, "nuiClass", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

@end
