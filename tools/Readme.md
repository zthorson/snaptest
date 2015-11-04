# Binary Tools Directory

This directory is meant to contain binary tools that must be compiled for the ARM platform. 

# Android.mk Settings

Only put tools that build to $(BUILD_EXECUTABLE) or $(BUILD_STATIC_LIBRARY) in order to keep the build system structured.  The output of these builds will end up in /bin directory of the system.img if this standard is followed.

Drivers an other apps should go in a separate directory.
