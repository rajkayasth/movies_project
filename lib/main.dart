import '../../../utils/exports.dart';

void main() {
  mainDelegate();
}

void mainDelegate() => AppInitializer.init(
      () async {
    runApp(const  MyApp());
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void configLoader() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 40
      ..radius = 12
      ..progressWidth = 4
      ..textColor = Colors.white
      ..progressColor = Colors.white
      ..backgroundColor = Colors.deepOrangeAccent
      ..indicatorColor = Colors.white
      ..userInteractions = false
      ..dismissOnTap = false;
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = GetIt.instance<AppRouter>();

    return MaterialApp.router(
      builder: EasyLoading.init(
        builder: (BuildContext context, Widget? child) {
          configLoader();
          return child ?? const SizedBox();
        },
      ),
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // routerDelegate: appRouter.delegate(),
      routerConfig: appRouter.config(),
      // routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
    );
  }

  /// Configures the settings for the EasyLoading widget, including appearance
  /// and behavior like duration, indicator type, size, and colors.
}
