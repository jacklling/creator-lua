LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dlua_shared

LOCAL_MODULE_FILENAME := libcocos2dlua
# change====remove the old we will ues other instaeded ======begin
# LOCAL_SRC_FILES := \
# ../../Classes/AppDelegate.cpp \
# hellolua/main.cpp
# change====remove the old we will ues other instaeded ======end
#change====traverse all the directory and subdirectory  ===begin
define walk  
	$(wildcard $(1)) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e)))  
endef
#change====  traverse Classes Directory ======end

#change==== scan the cpp and c from Classed dir ===begin
ALLFILES = $(call walk, $(LOCAL_PATH)/../../Classes)
FILE_LIST := hellolua/main.cpp
FILE_LIST += $(filter %.cpp, $(ALLFILES))
FILE_LIST += $(filter %.c, $(ALLFILES))
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)
#change==== scan the cpp and c from Classed dir ===end

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes
# add then file search path to C_INCLUDES if the author change please change this files ===begin
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/collider
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/animation
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/dragonbones/cocos2dx
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/dragonbones/armature
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/dragonbones/animation
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/dragonbones/events
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/dragonbones/factories
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/dragonbones/core
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/dragonbones/geom
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/lua-bindings
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/lua-bindings/dragonbones
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/reader/lua-bindings/reader
# add then file search path to C_INCLUDES if the author change please change this files ===end
# _COCOS_HEADER_ANDROID_BEGIN
# _COCOS_HEADER_ANDROID_END

LOCAL_STATIC_LIBRARIES := cocos2d_lua_static

# _COCOS_LIB_ANDROID_BEGIN
# _COCOS_LIB_ANDROID_END

include $(BUILD_SHARED_LIBRARY)

$(call import-module,scripting/lua-bindings/proj.android)

# _COCOS_LIB_IMPORT_ANDROID_BEGIN
# _COCOS_LIB_IMPORT_ANDROID_END
