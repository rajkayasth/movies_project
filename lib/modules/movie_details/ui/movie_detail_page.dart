import '../../../utils/exports.dart';

@RoutePage()
class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movieId});

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailCubit(
        movieDetailRepositoryImpl: MovieDetailRepositoryImpl(),
        movieId: movieId,
      ),
      child: MovieDetailWidget(movieId: movieId,),
    );
  }
}
