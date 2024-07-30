// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:pureblog/feature/home/view_model/home_view_model.dart';
// import 'package:pureblog/feature/home/view_model/state/home_view_state.dart';
// import 'mock/blog_cache_mock.dart';
// import 'mock/blog_service_mock.dart';

// void main() {
//   HomeViewModel? homeViewModel;

//   setUp(() {
//     homeViewModel = HomeViewModel(
//       blogManager: BlogServiceMock(),
//       blogCacheOperation: BlogCacheMock(),
//     );
//   });

//   group('Home View Model Test', () {
//     test('Inital Loading State', () {
//       expect(homeViewModel!.state.isLoading, false);
//     });

//     blocTest<HomeViewModel, HomeViewState>(
//       'Change Loading State',
//       build: () => homeViewModel!,
//       act: (bloc) => bloc.changeLoading(),
//       expect: () => [
//         isA<HomeViewState>()
//             .having((state) => state.isLoading, 'isLoading', true),
//       ],
//     );

//     blocTest<HomeViewModel, HomeViewState>(
//       'Get Blogs',
//       build: () => homeViewModel!,
//       act: (bloc) async => bloc.getBlogs(),
//       expect: () => [
//         isA<HomeViewState>()
//             .having((state) => state.blogs, 'blogs', isNotEmpty),
//       ],
//     );

//     test('Check Cached Blogs', () async {
//       await homeViewModel!.getBlogs();
//       expect(homeViewModel!.cachedBlogs, isNotEmpty);
//     });
//   });
// }
