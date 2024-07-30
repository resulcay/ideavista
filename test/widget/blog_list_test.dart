// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:gen/gen.dart';
// import 'package:network_image_mock/network_image_mock.dart';
// import 'package:pureblog/feature/home/view/widget/blog_list.dart';

// void main() {
//   testWidgets('Blog List Test', (widgetTester) async {
//     final blogs = [
//       Blog(
//         blogTitle: 'Title 1',
//         blogContent: 'Content 1',
//         blogImage: '/coredemotheme/images/1.jpg',
//       ),
//       Blog(
//         blogTitle: 'Title 2',
//         blogContent: 'Content 2',
//         blogImage: '/coredemotheme/images/2.jpg',
//       ),
//       Blog(
//         blogTitle: 'Title 3',
//         blogContent: 'Content 3',
//         blogImage: '/coredemotheme/images/3.jpg',
//       ),
//     ];

//     await mockNetworkImagesFor(
//       () => widgetTester.pumpWidget(
//         MaterialApp(home: Scaffold(body: BlogList(blogs: blogs))),
//       ),
//     );

//     for (final blog in blogs) {
//       expect(find.text(blog.blogTitle.toString()), findsOneWidget);
//     }
//   });
// }
