import '../../../../utils/exports.dart';

abstract class MovieListRepository {
  Future<MovieListReponseModel>? getMoviesList({
    required int pageNumber,
  });
}
