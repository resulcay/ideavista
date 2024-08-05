import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ideavista/utility/constant/color/color.dart';
import 'package:ideavista/utility/constant/enum/locales.dart';
import 'package:ideavista/utility/language/locale_keys.g.dart';

class HomeViewDrawer extends StatelessWidget {
  const HomeViewDrawer({
    required this.mainContext,
    super.key,
  });

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorConstants.secondaryColor,
            ),
            child: Column(
              children: [
                Text(LocaleKeys.title.tr()),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    width: 100,
                    'https://picsum.photos/250?image=2',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Türkçe'),
            onTap: () => mainContext.setLocale(Locales.tr.locale),
          ),
          ListTile(
            title: const Text('English'),
            onTap: () => mainContext.setLocale(Locales.en.locale),
          ),
        ],
      ),
    );
  }
}
