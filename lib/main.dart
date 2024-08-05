import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ideavista/utility/init/app_init.dart';
import 'package:ideavista/utility/language/language_manager.dart';
import 'package:ideavista/utility/theme/dark_theme.dart';
import 'package:ideavista/utility/theme/light_theme.dart';
import 'package:ideavista/view/home/home_view.dart';

Future<void> main() async {
  await ApplicationInitialization().initConfig();
  runApp(LanguageManager(child: const Root()));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IdeaVista',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: LightTheme().theme,
      darkTheme: DarkTheme().theme,
      home: const HomeView(),
    );
  }
}
