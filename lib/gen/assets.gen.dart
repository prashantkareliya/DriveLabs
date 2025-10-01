// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dob.png
  AssetGenImage get dob => const AssetGenImage('assets/images/dob.png');

  /// File path: assets/images/google_img.png
  AssetGenImage get googleImg =>
      const AssetGenImage('assets/images/google_img.png');

  /// File path: assets/images/intro_1.png
  AssetGenImage get intro1 => const AssetGenImage('assets/images/intro_1.png');

  /// File path: assets/images/intro_2.png
  AssetGenImage get intro2 => const AssetGenImage('assets/images/intro_2.png');

  /// File path: assets/images/intro_3.png
  AssetGenImage get intro3 => const AssetGenImage('assets/images/intro_3.png');

  /// File path: assets/images/intro_4.png
  AssetGenImage get intro4 => const AssetGenImage('assets/images/intro_4.png');

  /// File path: assets/images/loader.png
  AssetGenImage get loader => const AssetGenImage('assets/images/loader.png');

  /// File path: assets/images/login_registration.png
  AssetGenImage get loginRegistration =>
      const AssetGenImage('assets/images/login_registration.png');

  /// File path: assets/images/login_registration_2.png
  AssetGenImage get loginRegistration2 =>
      const AssetGenImage('assets/images/login_registration_2.png');

  /// File path: assets/images/tab_login.png
  AssetGenImage get tabLogin =>
      const AssetGenImage('assets/images/tab_login.png');

  /// File path: assets/images/tab_login_inactive.png
  AssetGenImage get tabLoginInactive =>
      const AssetGenImage('assets/images/tab_login_inactive.png');

  /// File path: assets/images/tab_register.png
  AssetGenImage get tabRegister =>
      const AssetGenImage('assets/images/tab_register.png');

  /// File path: assets/images/tab_register_inactive.png
  AssetGenImage get tabRegisterInactive =>
      const AssetGenImage('assets/images/tab_register_inactive.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    dob,
    googleImg,
    intro1,
    intro2,
    intro3,
    intro4,
    loader,
    loginRegistration,
    loginRegistration2,
    tabLogin,
    tabLoginInactive,
    tabRegister,
    tabRegisterInactive,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
