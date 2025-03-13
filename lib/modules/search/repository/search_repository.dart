import '../../../../utils/exports.dart';

abstract class SearchRepository {
  Future<SearchMovieResponseModel>? getMoviesList({
    required int pageNumber,
    required String searchParam,
  });
}
