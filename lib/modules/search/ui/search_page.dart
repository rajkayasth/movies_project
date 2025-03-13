import '../../../../utils/exports.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SearchCubit.instance(
        repository: SearchRepositoryImpl()
      ),
      child: const SearchWidget(
      ),
    );
  }
}
