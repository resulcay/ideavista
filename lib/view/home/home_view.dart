import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ideavista/product/model/photo.dart';
import 'package:ideavista/view/home/widget/home_view_app_bar.dart';
import 'package:ideavista/view/home/widget/home_view_drawer.dart';
import 'package:ideavista/view/home/widget/home_view_navbar.dart';
import 'package:ideavista/view/home/widget/photo_tile.dart';
import 'package:ideavista/view/home/mixin/home_view_mixin.dart';
import 'package:ideavista/view_model/home/home_view_model.dart';
import 'package:ideavista/view_model/home/home_view_state.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with HomeViewMixin, SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocSelector<HomeViewModel, HomeViewState, List<Photo>?>(
        selector: (state) => state.photos ?? [],
        builder: (context, state) {
          if (state!.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: HomeViewAppBar(),
            bottomNavigationBar:
                HomeViewBottomNavbar(tabController: tabController),
            drawer: HomeViewDrawer(mainContext: context),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AnimationLimiter(
                  child: MasonryGridView.builder(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: PhotoTile(
                              index: index,
                              photo: state[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
