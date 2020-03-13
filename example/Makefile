ARCHS = arm64 arm64e #Target devices i.e A7 - A13

THEOS_DEVICE_IP = 192.168.0.11 #Replace the IP address with yours then run "make package install" in iTerm

FINALPACKAGE = 1
DEBUG = 0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = example

example_FILES = Tweak.xm
example_CFLAGS = -fobjc-arc -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += exampleprefs
# Here you can link your tweak to your prefs
include $(THEOS_MAKE_PATH)/aggregate.mk

example_EXTRA_FRAMEWORKS += Cephei # You will need to add this extra framework for Cephei in your tweak makefile & prefs makefile


export TARGET = iphone:clang:13.0:12.0 #for tweaks target (iOS 13 & iOS 12)

# Delete DS_STORE when compile the tweak
after-stage::
	find . -name ".DS_STORE" -delete
