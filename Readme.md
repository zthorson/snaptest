# Sample Device Configuration

This sample configuration was provided by Embedded Android by Karim Yaghmour.  From Chaper 4 pages 143-146.

It was primarily written to act as a very basic, but functional example of the files required by a device in order to be built by the AOSP.  This is by no means a complete list of files, but is roughly the minimum.

## Version

This is meant to be compiled against Android 5.0.2 from googles source manifest file.

**IMPORTANT:** The CodeAuroraForum Manifest file (Included in the Inforce BSP Build) does NOT work for emulators.  Use the android source only for this project.

## Build Options

#### embedded_snaptest-eng

This is a complete barebones simulator environment.  It does NOT include the android framework or Java in any way.  Because of this, running this emulator will result in a blank screen, even though the environment boots.  You will have to use *adb shell* to interact with it.

#### full_snaptest-eng

This is a standard full build of android.  The emulator should boot and display the main screen to the user.

## Using

1. Set up the android development environment following the guide in [Establishing a Build Environment](https://source.android.com/source/initializing.html)

2. Follow the buid in [Downloading the Source](https://source.android.com/source/downloading.html) to get the source code for -b android-5.0.2_r3

3. Install libgl mesa for the emulator to avoid missing open GL Errors

```shell
$ sudo apt-get install libgl1-mesa-dev
```

4. Using a manifest_local.xml file or manual copying, move the contents of this repository into devices/sentera/snaptest

5. Run the build scripts via the following
```shell
$ source build/envsetup.sh
$ lunch full_snaptest-eng OR lunch embedded_snaptest-eng
$ make -j16
```

6. Run the emulator using the following.  
```shell
$ emulator -show-kernel &
```

## Notes

### Best Practices

The preferred method for adding files from here is to put all device-specific apps/binaries/libraries in this directory or its associated subdirectories.  This allows a centralized location for all board details and libraries required to make the custom AOSP build run.

Note that the qcom libraries break this mould, likely due to the proprietary files that they may not have wanted to include in the standard AOSP repository.

### Sharing Across Products

Under the company name, you can create a common directory (/devices/sentera/common) that can contain shared packages that all products in your line may share.  There are some examples on the in the /devices/qcom/common directory.

### Adding Packages

In the main or another subdirectory, add the required source along with an appropriate Android.mk file.  Then you MUST add the name of the package to the PRODUCT_PACKAGES variable, or the package will be build, but not added to the AOSP.

## TODO

Next steps involve seeing minimal I can make the build in preparation for doing the same to the production image.  This will involve no longer using full_base, but using something closser to embedded.mk.
