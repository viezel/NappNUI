#import "TiUITextField+Extended.h"

@implementation TiUITextField (Extended)


/**************************  
 NEW EXTENDED API 
 **************************/

- (void) setHintTextColor_:(id)color
{
    /*
	if([TiUtils isIOS6OrGreater]){
        UIColor *color = [UIColor redColor];
        self.textWidgetView.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"text" attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        [self.textWidgetView setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    }
    */
    color = [TiUtils colorValue:color];
    [self.textWidgetView setValue:[color _color] forKeyPath:@"_placeholderLabel.textColor"];
}



- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TextField";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if ([self nuiShouldBeApplied]) {
        [NUIRenderer renderTextField:self.textWidgetView withClass:self.nuiClass];
    }
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

- (BOOL)nuiShouldBeApplied
{
    if (![self.nuiClass isEqualToString:@"none"]) {
        if (![[self superview] isKindOfClass:[UISearchBar class]]) {
            return YES;
        }
    }
    return NO;
}

// Padding apparently can't be modified during didMoveToWindow
- (CGRect)override_textRectForBounds:(CGRect)bounds {
    if ([self nuiShouldBeApplied] &&
        [NUISettings hasProperty:@"padding" withClass:self.nuiClass]) {
        UIEdgeInsets insets = [NUISettings getEdgeInsets:@"padding" withClass:self.nuiClass];
        return CGRectMake(bounds.origin.x + insets.left,
                          bounds.origin.y + insets.top,
                          bounds.size.width - (insets.left + insets.right),
                          bounds.size.height - (insets.top + insets.bottom));
    } else {
        return [self override_textRectForBounds:bounds];
    }
}

- (CGRect)override_editingRectForBounds:(CGRect)bounds {
    return [self.textWidgetView textRectForBounds:bounds];
}

@end
