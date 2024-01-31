// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

/// Here is the simplest demo.
///
/// Please follow the link below to see more details.
/// [Examples](https://github.com/ZEGOCLOUD/zego_uikit_prebuilt_live_streaming_example_flutter)

Widget liveStreamingPage() {
  return ZegoUIKitPrebuiltLiveStreaming(
    appID: your AppID,
    appSign: your AppSign,
    userID: local user id,
    userName: local user name,
    liveID: live id,
    config: true
        ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
        : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
  );
}
