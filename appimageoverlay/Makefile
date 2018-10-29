include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppImageOverlay
AppImageOverlay_FILES = Tweak.xm PIImageView.m

AppImageOverlay_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpectrumViewFree"
