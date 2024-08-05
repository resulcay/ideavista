import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ideavista/utility/constant/enum/locales.dart';

final class LanguageManager extends EasyLocalization {
  LanguageManager({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _assetPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales =
      Locales.values.map((e) => e.locale).toList();

  static const String _assetPath = 'assets/translations';

  static Future<void> changeLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
