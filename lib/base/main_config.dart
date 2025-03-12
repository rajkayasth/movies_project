import '../utils/exports.dart';

class MainConfig {

  static ApiClient get apiClient => getIt<ApiClient>();
  static BuildContext context = getIt<AppRouter>().navigatorKey.currentContext!;

  static TextTheme get textTheme => MainConfig.context.theme.textTheme;
}
