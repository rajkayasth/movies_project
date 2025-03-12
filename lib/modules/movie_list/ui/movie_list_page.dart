import '../../../../utils/exports.dart';

@RoutePage()
class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (c) => MovieListCubit(),
        child: const MovieListWidget());
  }
}
