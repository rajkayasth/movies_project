import '../../../utils/exports.dart';

final GetIt getIt = GetIt.instance;
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

void setupLocator() {
  getIt..registerSingleton<AppRouter>(AppRouter(navigatorKey: appNavigatorKey))
  ..registerSingleton<MainConfig>(MainConfig())
  ..registerSingleton<ApiClient>(ApiClient());
}
