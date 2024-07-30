import 'package:cached_network_image/cached_network_image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dio/dio.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideavista/color.dart';
import 'package:ideavista/response.dart';

//#1C274C

final EasyLogger logger = EasyLogger(
  name: 'NamePrefix',
  defaultLevel: LevelMessages.debug,
  enableBuildModes: [BuildMode.debug, BuildMode.profile, BuildMode.release],
  enableLevels: [LevelMessages.debug, LevelMessages.info, LevelMessages.error],
);
void main() {
  DioManager().fetchPhotos();
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IdeaVista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.comfortaaTextTheme(),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.comfortaaTextTheme(),
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController pageViewController;

  @override
  void initState() {
    pageViewController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        onPressed: () {
                          Scaffold.of(ctx).openDrawer();
                        },
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
                        onPressed: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            useSafeArea: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Scaffold(
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
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                floatingActionButton: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.search),
                                ),
                              );
                            },
                          );
                        },
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
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.black,
        controller: pageViewController,
        style: TabStyle.titled,
        items: [
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(
            icon: SvgPicture.asset(
              color: ColorConstants.secondaryColor,
              'assets/images/home.svg',
              height: 40,
            ),
            title: 'aasdsd',
          ),
          TabItem(icon: Icons.favorite, title: 'Favorites'),
        ],
        initialActiveIndex: 0,
        onTap: (index) {
          logger.debug('Current Index: $index');
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorConstants.secondaryColor,
              ),
              child: Column(
                children: [
                  Text('Drawer Header'),
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
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
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
                            child: Tile(
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

class Tile extends StatefulWidget {
  const Tile({
    required this.index,
    required this.photo,
    super.key,
  });
  final int index;
  final Photo photo;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Hero(
        tag: widget.index,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.photo.src?.portrait ?? '',
              // placeholder: (context, url) =>
              //     Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class DioManager {
  final Dio _dio = Dio();

  Future<List<Photo>?> fetchPhotos() async {
    _dio.options.headers['Authorization'] =
        'UW8js99VZYXhGRJDWL1k0VbNpL8dWWur5L4EeeqfE8QxoTOe8GhD1tdj9Uc';
    final response = await _dio.get<dynamic>(
      'https://api.pexels.com/v1/search',
      queryParameters: {
        'query': 'forest',
        'per_page': 60,
      },
    );

    final temp = response.data as Map<String, dynamic>;
    final data = ImageResponse.fromJson(temp);

    return data.photos;
  }
}
