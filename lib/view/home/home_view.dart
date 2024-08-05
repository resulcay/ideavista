import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ideavista/network/dio_manager.dart';
import 'package:ideavista/view/home/widget/home_view_app_bar.dart';
import 'package:ideavista/view/home/widget/home_view_drawer.dart';
import 'package:ideavista/view/home/widget/home_view_navbar.dart';
import 'package:ideavista/view/home/widget/photo_tile.dart';
import 'package:ideavista/view_model/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with HomeViewModel, SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeViewAppBar(),
      bottomNavigationBar: HomeViewBottomNavbar(tabController: tabController),
      drawer: HomeViewDrawer(mainContext: context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: FutureBuilder(
            future: DioManager().fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.hasData) {
                final photos = snapshot.data!;

                return AnimationLimiter(
                  child: MasonryGridView.builder(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: PhotoTile(
                              index: index,
                              photo: photos[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
