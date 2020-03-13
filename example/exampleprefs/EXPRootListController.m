#include "EXPRootListController.h"

@implementation EXPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self]; // "Root" it will load your root.plist for prefs in setting, if you rename your root.plist you will need to rename it here too.
	}

	return _specifiers;
}

@end
