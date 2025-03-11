import '../../../../utils/exports.dart';

@RoutePage()
class TabOnePage extends StatelessWidget {
  const TabOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (c) => TabOneCubit.instance(),
        child: const TabOneSuccessWidget());
  }
}
