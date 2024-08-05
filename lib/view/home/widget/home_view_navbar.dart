import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ideavista/utility/language/locale_keys.g.dart';

class HomeViewBottomNavbar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeViewBottomNavbar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Size get preferredSize => Size.fromHeight(kBottomNavigationBarHeight);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.black,
      controller: tabController,
      style: TabStyle.titled,
      items: [
        TabItem(icon: Icons.search, title: LocaleKeys.tabBar_search.tr()),
        TabItem(
          icon: Icons.home,
          title: LocaleKeys.tabBar_home.tr(),
        ),
        TabItem(icon: Icons.favorite, title: LocaleKeys.tabBar_favorites.tr()),
      ],
      initialActiveIndex: 0,
      onTap: (index) {},
    );
  }
}
