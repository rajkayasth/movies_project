import '../../../../utils/exports.dart';

@RoutePage()
class TabTwoPage extends StatelessWidget {
  const TabTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TabTwoCubit.instance(),
      child: const TabTwoWidget(
      ),
    );
  }
}
