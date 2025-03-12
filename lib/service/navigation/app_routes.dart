import '../../utils/exports.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey: navigatorKey);
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: DashboardRoute.page,
      path: AppPaths.dashboard,
      maintainState: true,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        AutoRoute(
          page: MovieListRoute.page,
          path: AppPaths.movieListPage,
          initial: true, // Ensure the first tab is initial
        ),
        AutoRoute(
          page: SearchRoute.page,
          path: AppPaths.searchScreenPage,
        ),
      ],
    ),
  ];
}
