import '../../../../utils/exports.dart';

abstract class MovieDetailRepository {
  Future<MovieDetailResponseModel>? getMovieDetail({
    required String movieID,
  });

}
