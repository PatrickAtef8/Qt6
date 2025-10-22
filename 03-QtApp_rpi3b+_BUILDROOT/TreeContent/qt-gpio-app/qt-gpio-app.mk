################################################################################
#
# qt-gpio-app by Petooooooooooooo
#
################################################################################

QT_GPIO_APP_VERSION = 1.0
QT_GPIO_APP_SITE = package/qt-gpio-app
QT_GPIO_APP_SITE_METHOD = local

QT_GPIO_APP_DEPENDENCIES = qt6base qt6declarative

define QT_GPIO_APP_BUILD_CMDS
    cmake -S $(@D) -B $(@D)/build \
        -DCMAKE_TOOLCHAIN_FILE=/home/patrick/EmbeddedLinuxKitchen/buildroot/output/host/share/buildroot/toolchainfile.cmake
    $(MAKE) -C $(@D)/build
endef

define QT_GPIO_APP_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/build/qt-gpio-app $(TARGET_DIR)/usr/bin/qt-gpio-app
endef

$(eval $(generic-package))

