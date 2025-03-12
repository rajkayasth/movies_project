import 'package:flutter/cupertino.dart';

import '../../utils/exports.dart';

///this class will initialize all the services and configurations
abstract class AppInitializer {
  static void init(
    VoidCallback runApp,
  ) {
    ErrorWidget.builder = (errorDetails) {
      return Text(
        errorDetails.exceptionAsString(),
      );
    };
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
      };
      await _initServices();
      runApp();
    }, (exception, stackTrace) async {
      if (kDebugMode) {
        print('runZonedGuarded: ${exception.toString()}');
      }
    });
  }

  static FutureOr<void> _initServices() async {
    try {
      // _initScreenPreference();
      _setStatusBarTheme();
      setupLocator();

    } catch (err) {
      rethrow;
    }
  }

/*
  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
*/

  /// StatusBar Customise
  ///
  static void _setStatusBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // Same as AppBar color
        statusBarIconBrightness: Brightness.light,
        // Status bar icon/text color (Android)
        statusBarBrightness:
            Brightness.light, // Status bar icon/text color (iOS)
      ),
    );
  }
}
