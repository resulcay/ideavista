import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ideavista/product/constant/color/color.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeViewAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        Builder(
          builder: (ctx) {
            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () => _showDrawerComponent(ctx),
                      icon: Icon(Icons.menu_rounded),
                      iconSize: 30,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/icon_outlined.svg',
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () => _showSearchComponent(context),
                      icon: const Icon(Icons.search),
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void _showDrawerComponent(BuildContext ctx) {
    Scaffold.of(ctx).openDrawer();
  }

  Future<void> _showSearchComponent(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: DraggableScrollableSheet(
            snap: true,
            initialChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(Icons.search),
          ),
        );
      },
    );
  }
}
