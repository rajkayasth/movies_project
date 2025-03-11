// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:movie_project/modules/dashboard/ui/dashboard_page.dart' as _i1;
import 'package:movie_project/modules/tab_one/ui/tab_one_page.dart' as _i2;
import 'package:movie_project/modules/tab_two/ui/tab_two_page.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    TabOneRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TabOnePage(),
      );
    },
    TabTwoRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TabTwoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TabOnePage]
class TabOneRoute extends _i4.PageRouteInfo<void> {
  const TabOneRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TabOneRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabOneRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TabTwoPage]
class TabTwoRoute extends _i4.PageRouteInfo<void> {
  const TabTwoRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TabTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabTwoRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
