PACKAGECONFIG_GL = " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)} "
PACKAGECONFIG:append = " eglfs kms gbm linuxfb fontconfig icu accessibility "
QT_CONFIG_FLAGS += " -no-sse2 -no-opengles3"
EXTRA_OECMAKE += "-DQT_FEATURE_egl=ON -DFEATURE_opengl=ON"
