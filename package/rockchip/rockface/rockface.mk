ifeq ($(BR2_PACKAGE_ROCKFACE), y)
    ROCKFACE_SITE = $(TOPDIR)/../external/rockface
    ROCKFACE_SITE_METHOD = local
    ROCKFACE_INSTALL_STAGING = YES
    ROCKFACE_DEPENDENCIES = rknpu

ifeq ($(BR2_PACKAGE_RK1806),y)
    ROCKFACE_COMPILE_PLATFORM = rk1806
endif

ifeq ($(BR2_PACKAGE_RK1808),y)
    ROCKFACE_COMPILE_PLATFORM = rk1808
endif

ifeq ($(BR2_PACKAGE_RK3399PRO),y)
    ROCKFACE_COMPILE_PLATFORM = rk3399pro
endif

ifeq ($(BR2_arm),y)
    ROCKFACE_COMPILE_LIB = lib
else
    ROCKFACE_COMPILE_LIB = lib64
endif

    ROCKFACE_CONF_OPTS = -DCOMPILE_PLATFORM=$(ROCKFACE_COMPILE_PLATFORM)-Linux  -DCOMPILE_LIB=$(ROCKFACE_COMPILE_LIB)

    $(eval $(cmake-package))
endif
