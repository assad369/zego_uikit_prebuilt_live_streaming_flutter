// Flutter imports:
import 'package:flutter/material.dart';

class PrebuiltLiveStreamingImage {
  static Image asset(String name) {
    return Image.asset(name, package: "zego_uikit_prebuilt_live_streaming");
  }

  static AssetImage assetImage(String name) {
    return AssetImage(name, package: "zego_uikit_prebuilt_live_streaming");
  }
}

class PrebuiltLiveStreamingIconUrls {
  static const String im = 'assets/icons/toolbar_im.png';
  static const String background = 'assets/icons/bg.png';
  static const String back = 'assets/icons/back.png';
  static const String toolbarSoundEffect = 'assets/icons/toolbar_sound.png';
  static const String toolbarBeautyEffect = 'assets/icons/toolbar_beauty.png';
  static const String toolbarCameraNormal =
      'assets/icons/toolbar_camera_normal.png';
  static const String toolbarCameraOff = 'assets/icons/toolbar_camera_off.png';
  static const String toolbarFlipCamera =
      'assets/icons/toolbar_flip_camera.png';
  static const String toolbarMicNormal = 'assets/icons/toolbar_mic_normal.png';
  static const String toolbarMicOff = 'assets/icons/toolbar_mic_off.png';

  static const String effectReset = "assets/icons/effect_reset.png";
}
