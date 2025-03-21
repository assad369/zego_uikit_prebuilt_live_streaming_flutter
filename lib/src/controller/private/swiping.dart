part of 'package:zego_uikit_prebuilt_live_streaming/src/controller.dart';

/// @nodoc
mixin ZegoLiveStreamingControllerSwipingPrivate {
  final _private = ZegoLiveStreamingControllerSwipingPrivateImpl();

  /// Don't call that
  ZegoLiveStreamingControllerSwipingPrivateImpl get private => _private;
}

/// @nodoc
/// Here are the APIs related to invitation.
class ZegoLiveStreamingControllerSwipingPrivateImpl {
  ZegoLiveStreamingSwipingConfig? config;

  StreamController<String>? stream;
  bool _currentRoomSwipingDone = false;
  String _currentSwipingID = '';

  bool get currentRoomSwipingDone => _currentRoomSwipingDone;
  set currentRoomSwipingDone(bool value) {
    _currentRoomSwipingDone = value;

    ZegoLoggerService.logInfo(
      'update current swiping state:$_currentRoomSwipingDone',
      tag: 'live.swiping',
      subTag: 'controller.swiping.p',
    );
  }

  String get currentSwipingID => _currentSwipingID;
  set currentSwipingID(String value) {
    _currentSwipingID = value;

    ZegoLoggerService.logInfo(
      'update current swiping id:$_currentSwipingID',
      tag: 'live.swiping',
      subTag: 'controller.swiping.p',
    );
  }

  /// Please do not call this interface. It is the internal logic of Prebuilt.
  void initByPrebuilt({
    required ZegoLiveStreamingSwipingConfig? swipingConfig,
  }) {
    ZegoLoggerService.logInfo(
      'init by prebuilt',
      tag: 'live.swiping',
      subTag: 'controller.swiping.p',
    );

    stream ??= StreamController<String>.broadcast();
    config = swipingConfig;
  }

  /// Please do not call this interface. It is the internal logic of Prebuilt.
  void uninitByPrebuilt() {
    ZegoLoggerService.logInfo(
      'un-init by prebuilt',
      tag: 'live.swiping',
      subTag: 'controller.swiping.p',
    );

    config = null;

    stream?.close();
    stream = null;
  }
}
