/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bell.png
  AssetGenImage get bell => const AssetGenImage('assets/icons/bell.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/message.png
  AssetGenImage get message => const AssetGenImage('assets/icons/message.png');

  /// File path: assets/icons/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/icons/notification.png');

  /// File path: assets/icons/right-arrow.png
  AssetGenImage get rightArrow =>
      const AssetGenImage('assets/icons/right-arrow.png');

  /// File path: assets/icons/user-icon.png
  AssetGenImage get userIcon =>
      const AssetGenImage('assets/icons/user-icon.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bell, home, message, notification, rightArrow, userIcon, user];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/aboutus-header.png
  AssetGenImage get aboutusHeader =>
      const AssetGenImage('assets/images/aboutus-header.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  $AssetsImagesMenuGen get menu => const $AssetsImagesMenuGen();

  /// File path: assets/images/onboard-1.png
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/images/onboard-1.png');

  /// File path: assets/images/onboard-2.png
  AssetGenImage get onboard2 =>
      const AssetGenImage('assets/images/onboard-2.png');

  /// File path: assets/images/onboard-3.png
  AssetGenImage get onboard3 =>
      const AssetGenImage('assets/images/onboard-3.png');

  /// File path: assets/images/onboard-4.png
  AssetGenImage get onboard4 =>
      const AssetGenImage('assets/images/onboard-4.png');

  /// File path: assets/images/ornament.png
  AssetGenImage get ornament =>
      const AssetGenImage('assets/images/ornament.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [aboutusHeader, logo, onboard1, onboard2, onboard3, onboard4, ornament];
}

class $AssetsImagesMenuGen {
  const $AssetsImagesMenuGen();

  /// File path: assets/images/menu/about-us.png
  AssetGenImage get aboutUs =>
      const AssetGenImage('assets/images/menu/about-us.png');

  /// File path: assets/images/menu/materi.png
  AssetGenImage get materi =>
      const AssetGenImage('assets/images/menu/materi.png');

  /// File path: assets/images/menu/quiz.png
  AssetGenImage get quiz => const AssetGenImage('assets/images/menu/quiz.png');

  /// File path: assets/images/menu/tips.png
  AssetGenImage get tips => const AssetGenImage('assets/images/menu/tips.png');

  /// List of all assets
  List<AssetGenImage> get values => [aboutUs, materi, quiz, tips];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
