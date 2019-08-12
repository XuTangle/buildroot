LOCK_SITE = $(TOPDIR)/../app/lock
LOCK_SITE_METHOD = local
LOCK_INSTALL_STAGING = YES

# add dependencies
LOCK_DEPENDENCIES = camerahal rkfb rkrga face_service

COMPILE_PROJECT_TYPE=$(call qstrip,$(BR2_PACKAGE_LOCK_PROJECT_TYPE))

LOCK_DEPENDENCIES += libpng12 rv1108_minigui
ifeq ($(BR2_PACKAGE_FREETYPE), y)
    LOCK_DEPENDENCIES += freetype
    LOCK_CONF_OPTS += -DCOMPILE_UI_TRUETYPE=$(COMPILE_UI_TRUETYPE)
endif

ifeq ($(BR2_PACKAGE_TSLIB), y)
    LOCK_DEPENDENCIES += tslib
    LOCK_CONF_OPTS += -DCOMPILE_UI_TSLIB=$(COMPILE_UI_TSLIB)
endif

ifeq ($(BR2_PACKAGE_SQLITE),y)
    LOCK_DEPENDENCIES += sqlite
    LOCK_CONF_OPTS += -DUSE_SQLITE=y
endif

ifeq ($(BR2_PACKAGE_DATABASE),y)
    LOCK_DEPENDENCIES += database
    LOCK_CONF_OPTS += -DUSE_DATABASE=y
endif

ifeq ($(BR2_PACKAGE_LOCK_ENABLE_DISP_HOLD),y)
    LOCK_CONF_OPTS += -DENABLE_DISP_HOLD=1
endif

LOCK_CONF_OPTS += -DCOMPILE_PROJECT_TYPE=$(BR2_PACKAGE_LOCK_PROJECT_TYPE)
LOCK_CONF_OPTS += -DCOMPILE_BOARD_VERSION=rv1108-$(RK_TARGET_BOARD_VERSION)
LOCK_CONF_OPTS += -DResolution=$(call qstrip,$(RK_UI_RESOLUTION))

LOCK_CONF_OPTS += \
    -DMAIN_APP_PRE_FACE_ROTATE=$(BR2_PACKAGE_FACE_SERVICE_PRE_FACE_ROTATE) \
    -DMAX_FEATURE_OF_USER=$(BR2_PACKAGE_FACE_SERVICE_MAX_FEATURE_OF_USER) 

$(eval $(cmake-package))
