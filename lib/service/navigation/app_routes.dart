import '../../utils/exports.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
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
          page: TabOneRoute.page,
          path: AppPaths.tabOne,
          initial: true, // Ensure the first tab is initial
        ),
        AutoRoute(
          page: TabTwoRoute.page,
          path: AppPaths.tabTwo,
        ),
      ],
    ),
  ];
}
