import '../../../../utils/exports.dart';

class MoviesListRepositoryImpl extends MovieListRepository {
  @override
  Future<MovieListReponseModel>? getMoviesList({required int pageNumber}) async {
    try {
      final response = await MainConfig.apiClient.get(
        Apis.discoverMoviesList,
        params: {"page": pageNumber},
      );

      // Log response data for debugging
      print('API Response Data: ${response?.data}');

      // If the response is valid, parse the data
      return MovieListReponseModel.fromJson(response?.data);
    } on DioException catch (e) {
      // Log the error
      print('Error fetching data: ${e.message}');
      throw Exception('Failed to fetch data: ${e.message}');
    }
  }

}
