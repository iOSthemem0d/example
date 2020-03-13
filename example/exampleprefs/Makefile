ARCHS = arm64 arm64e # Here you target the device and add slice for the prefs to show in setting app

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = exampleprefs

exampleprefs_FILES = $(wildcard *.m) # This will compile multiple rootlistcontroller.m rather than keep adding each of them in makefile
exampleprefs_INSTALL_PATH = /Library/PreferenceBundles
exampleprefs_FRAMEWORKS = UIKit
exampleprefs_PRIVATE_FRAMEWORKS = Preferences
exampleprefs_CFLAGS = -fobjc-arc

exampleprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
# Cephei for tweak and Cepheiprefs for your prefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/exampleprefs.plist$(ECHO_END)
