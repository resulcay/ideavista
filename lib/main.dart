import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ideavista/product/init/app_init.dart';
import 'package:ideavista/product/language/language_manager.dart';
import 'package:ideavista/product/navigation/route_manager.dart';
import 'package:ideavista/product/theme/dark_theme.dart';
import 'package:ideavista/product/theme/light_theme.dart';

Future<void> main() async {
  await ApplicationInitialization().initConfig();
  runApp(LanguageManager(child: const Root()));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteManager().config(),
      title: 'IdeaVista',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: LightTheme().theme,
      darkTheme: DarkTheme().theme,
    );
  }
}
