// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit/zego_uikit.dart';

// Project imports:
import 'package:zego_uikit_prebuilt_live_streaming/src/components/effects/effect_grid.dart';
import 'package:zego_uikit_prebuilt_live_streaming/src/internal/internal.dart';
import 'package:zego_uikit_prebuilt_live_streaming/src/live_streaming_inner_text.dart';

/// @nodoc
class ZegoSoundEffectSheet extends StatefulWidget {
  final ZegoInnerText translationText;
  final bool rootNavigator;

  final List<VoiceChangerType> voiceChangerEffect;
  final ValueNotifier<String> voiceChangerSelectedIDNotifier;

  final List<ReverbType> reverbEffect;
  final ValueNotifier<String> reverbSelectedIDNotifier;

  const ZegoSoundEffectSheet({
    Key? key,
    required this.translationText,
    required this.rootNavigator,
    required this.voiceChangerEffect,
    required this.voiceChangerSelectedIDNotifier,
    required this.reverbEffect,
    required this.reverbSelectedIDNotifier,
  }) : super(key: key);

  @override
  State<ZegoSoundEffectSheet> createState() => _ZegoSoundEffectSheetState();
}

/// @nodoc
class _ZegoSoundEffectSheetState extends State<ZegoSoundEffectSheet> {
  late ZegoEffectGridModel voiceChangerModel;
  late ZegoEffectGridModel reverbPresetModel;

  @override
  void initState() {
    super.initState();

    initVoiceChangerData();
    initReverbData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(98.zR),
        Container(height: 1.zR, color: Colors.white.withOpacity(0.15)),
        SizedBox(height: 36.zR),
        SizedBox(
          height: 600.zR - 98.zR - 36.zR - 1.zR,
          child: ListView(
            children: [
              ZegoEffectGrid(
                model: voiceChangerModel,
                isSpaceEvenly: false,
              ),
              SizedBox(height: 36.zR),
              ZegoEffectGrid(
                model: reverbPresetModel,
                isSpaceEvenly: false,
                withBorderColor: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget header(double height) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: widget.rootNavigator,
              ).pop();
            },
            child: SizedBox(
              width: 70.zR,
              height: 70.zR,
              child: PrebuiltLiveStreamingImage.asset(
                  PrebuiltLiveStreamingIconUrls.back),
            ),
          ),
          SizedBox(width: 10.zR),
          Text(
            widget.translationText.audioEffectTitle,
            style: TextStyle(
              fontSize: 36.0.zR,
              color: const Color(0xffffffff),
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  void initVoiceChangerData() {
    final voiceChangerEffect =
        List<VoiceChangerType>.from(widget.voiceChangerEffect)
          ..removeWhere((effect) => effect == VoiceChangerType.none)
          ..insert(0, VoiceChangerType.none);
    if (widget.voiceChangerSelectedIDNotifier.value.isEmpty) {
      widget.voiceChangerSelectedIDNotifier.value =
          voiceChangerEffect.first.index.toString();
    }

    voiceChangerModel = ZegoEffectGridModel(
      title: widget.translationText.audioEffectVoiceChangingTitle,
      selectedID: widget.voiceChangerSelectedIDNotifier,
      items: voiceChangerEffect
          .map(
            (effect) => ZegoEffectGridItem<VoiceChangerType>(
              id: effect.index.toString(),
              effectType: effect,
              icon: ButtonIcon(
                icon: PrebuiltLiveStreamingImage.asset(
                    'assets/icons/voice_changer_${effect.name}.png'),
              ),
              selectIcon: ButtonIcon(
                icon: PrebuiltLiveStreamingImage.asset(
                    'assets/icons/voice_changer_${effect.name}_selected.png'),
              ),
              iconText: voiceChangerTypeText(effect),
              onPressed: () {
                ZegoUIKit().setVoiceChangerType(effect.key);
              },
            ),
          )
          .toList(),
    );
    for (final item in voiceChangerModel.items) {
      item.icon.backgroundColor = const Color(0xff3b3a3d);
      item.selectIcon?.backgroundColor = const Color(0xff3b3a3d);
    }
  }

  void initReverbData() {
    final reverbEffect = List<ReverbType>.from(widget.reverbEffect)
      ..removeWhere((effect) => effect == ReverbType.none)
      ..insert(0, ReverbType.none);
    if (widget.reverbSelectedIDNotifier.value.isEmpty) {
      widget.reverbSelectedIDNotifier.value =
          reverbEffect.first.index.toString();
    }

    reverbPresetModel = ZegoEffectGridModel(
      title: widget.translationText.audioEffectReverbTitle,
      selectedID: widget.reverbSelectedIDNotifier,
      items: reverbEffect
          .map(
            (effect) => ZegoEffectGridItem<ReverbType>(
              id: effect.index.toString(),
              effectType: effect,
              icon: ButtonIcon(
                icon: PrebuiltLiveStreamingImage.asset(
                    'assets/icons/reverb_preset_${effect.name}.png'),
              ),
              iconText: reverbTypeText(effect),
              onPressed: () {
                ZegoUIKit().setReverbType(effect.key);
              },
            ),
          )
          .toList(),
    );
  }

  String voiceChangerTypeText(VoiceChangerType voiceChangerType) {
    switch (voiceChangerType) {
      case VoiceChangerType.none:
        return widget.translationText.voiceChangerNoneTitle;
      case VoiceChangerType.littleBoy:
        return widget.translationText.voiceChangerLittleBoyTitle;
      case VoiceChangerType.littleGirl:
        return widget.translationText.voiceChangerLittleGirlTitle;
      case VoiceChangerType.deep:
        return widget.translationText.voiceChangerDeepTitle;
      case VoiceChangerType.crystalClear:
        return widget.translationText.voiceChangerCrystalClearTitle;
      case VoiceChangerType.robot:
        return widget.translationText.voiceChangerRobotTitle;
      case VoiceChangerType.ethereal:
        return widget.translationText.voiceChangerEtherealTitle;
      case VoiceChangerType.female:
        return widget.translationText.voiceChangerFemaleTitle;
      case VoiceChangerType.male:
        return widget.translationText.voiceChangerMaleTitle;
      case VoiceChangerType.optimusPrime:
        return widget.translationText.voiceChangerOptimusPrimeTitle;
      case VoiceChangerType.cMajor:
        return widget.translationText.voiceChangerCMajorTitle;
      case VoiceChangerType.aMajor:
        return widget.translationText.voiceChangerAMajorTitle;
      case VoiceChangerType.harmonicMinor:
        return widget.translationText.voiceChangerHarmonicMinorTitle;
    }
  }

  String reverbTypeText(ReverbType reverbType) {
    switch (reverbType) {
      case ReverbType.none:
        return widget.translationText.reverbTypeNoneTitle;
      case ReverbType.ktv:
        return widget.translationText.reverbTypeKTVTitle;
      case ReverbType.hall:
        return widget.translationText.reverbTypeHallTitle;
      case ReverbType.concert:
        return widget.translationText.reverbTypeConcertTitle;
      case ReverbType.rock:
        return widget.translationText.reverbTypeRockTitle;
      case ReverbType.smallRoom:
        return widget.translationText.reverbTypeSmallRoomTitle;
      case ReverbType.largeRoom:
        return widget.translationText.reverbTypeLargeRoomTitle;
      case ReverbType.valley:
        return widget.translationText.reverbTypeValleyTitle;
      case ReverbType.recordingStudio:
        return widget.translationText.reverbTypeRecordingStudioTitle;
      case ReverbType.basement:
        return widget.translationText.reverbTypeBasementTitle;
      case ReverbType.popular:
        return widget.translationText.reverbTypePopularTitle;
      case ReverbType.gramophone:
        return widget.translationText.reverbTypeGramophoneTitle;
    }
  }
}

void showSoundEffectSheet(
  BuildContext context, {
  required ZegoInnerText translationText,
  required bool rootNavigator,
  required List<VoiceChangerType> voiceChangeEffect,
  required List<ReverbType> reverbEffect,
  required ValueNotifier<String> voiceChangerSelectedIDNotifier,
  required ValueNotifier<String> reverbSelectedIDNotifier,
}) {
  showModalBottomSheet(
    barrierColor: ZegoUIKitDefaultTheme.viewBarrierColor,
    backgroundColor: ZegoUIKitDefaultTheme.viewBackgroundColor,
    context: context,
    useRootNavigator: rootNavigator,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
    ),
    isDismissible: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 50),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: SizedBox(
            height: 600.zR,
            child: ZegoSoundEffectSheet(
              translationText: translationText,
              rootNavigator: rootNavigator,
              voiceChangerEffect: voiceChangeEffect,
              voiceChangerSelectedIDNotifier: voiceChangerSelectedIDNotifier,
              reverbEffect: reverbEffect,
              reverbSelectedIDNotifier: reverbSelectedIDNotifier,
            ),
          ),
        ),
      );
    },
  );
}
