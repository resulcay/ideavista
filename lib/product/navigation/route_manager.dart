import 'package:auto_route/auto_route.dart';
import 'package:ideavista/view/home/home_view.dart';

part 'route_manager.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
final class RouteManager extends RootStackRouter {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: HomeRoute.page, initial: true)];
}
