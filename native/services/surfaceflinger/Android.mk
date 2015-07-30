LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CLANG := true

LOCAL_MODULE                    := libexsurfaceflinger
LOCAL_MODULE_TAGS               := optional
LOCAL_MODULE_OWNER              := qti

LOCAL_PROPRIETARY_MODULE        := false
LOCAL_CFLAGS                    := -DLOG_TAG=\"ExSurfaceFlinger\"
LOCAL_CFLAGS                    += -DHAS_CONTEXT_PRIORITY

LOCAL_C_INCLUDES                += $(TARGET_OUT_HEADERS)
LOCAL_C_INCLUDES                += $(call project-path-for,qcom-display)/libgralloc \
                                   $(call project-path-for,qcom-display)/libqdutils \
                                   frameworks/native/services/surfaceflinger \
                                   vendor/qcom/opensource/display-frameworks/include

ifeq ($(TARGET_USES_QCOM_BSP), true)
    LOCAL_CFLAGS += -DQTI_BSP
endif

LOCAL_SHARED_LIBRARIES          := libsurfaceflinger libui libgui libqdutils \
                                   libbinder libutils libcutils \
                                   libandroid

LOCAL_SRC_FILES                 := ExLayer.cpp \
                                   ExSurfaceFlinger.cpp \
                                   DisplayHardware/ExVirtualDisplaySurface.cpp \
                                   DisplayHardware/ExHWComposer.cpp

include $(BUILD_STATIC_LIBRARY)
