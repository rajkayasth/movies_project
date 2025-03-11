import '../../../utils/exports.dart';

void main() {
  mainDelegate();
}

void mainDelegate() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // routerDelegate: appRouter.delegate(),
      routerConfig: appRouter.config(),
      // routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
    );
  }
}
