// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:movie_project/modules/dashboard/ui/dashboard_page.dart' as _i1;
import 'package:movie_project/modules/movie_details/ui/movie_detail_page.dart'
    as _i2;
import 'package:movie_project/modules/movie_list/ui/movie_list_page.dart'
    as _i3;
import 'package:movie_project/modules/no_internet/ui/no_internet_page.dart'
    as _i4;
import 'package:movie_project/modules/search/ui/search_page.dart' as _i5;
import 'package:movie_project/utils/exports.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.MovieDetailPage(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    MovieListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MovieListPage(),
      );
    },
    NoInternetRoute.name: (routeData) {
      final args = routeData.argsAs<NoInternetRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NoInternetPage(
          onTryAgain: args.onTryAgain,
          key: args.key,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SearchPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MovieDetailPage]
class MovieDetailRoute extends _i6.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i7.Key? key,
    required String movieId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            key: key,
            movieId: movieId,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static const _i6.PageInfo<MovieDetailRouteArgs> page =
      _i6.PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    required this.movieId,
  });

  final _i7.Key? key;

  final String movieId;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i3.MovieListPage]
class MovieListRoute extends _i6.PageRouteInfo<void> {
  const MovieListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MovieListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NoInternetPage]
class NoInternetRoute extends _i6.PageRouteInfo<NoInternetRouteArgs> {
  NoInternetRoute({
    required dynamic Function() onTryAgain,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          NoInternetRoute.name,
          args: NoInternetRouteArgs(
            onTryAgain: onTryAgain,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const _i6.PageInfo<NoInternetRouteArgs> page =
      _i6.PageInfo<NoInternetRouteArgs>(name);
}

class NoInternetRouteArgs {
  const NoInternetRouteArgs({
    required this.onTryAgain,
    this.key,
  });

  final dynamic Function() onTryAgain;

  final _i7.Key? key;

  @override
  String toString() {
    return 'NoInternetRouteArgs{onTryAgain: $onTryAgain, key: $key}';
  }
}

/// generated route for
/// [_i5.SearchPage]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
