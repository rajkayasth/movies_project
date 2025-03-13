import '../../../../utils/exports.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<SearchMovieResponseModel>? getMoviesList({
    required int pageNumber,
    required String searchParam,
  }) async {
    try {
      final response = await MainConfig.apiClient.get(
        Apis.searchMovie,
        params: {
          "page": pageNumber,
          "query": searchParam,
        },
      );

      // Log response data for debugging
      print('API Response Data: ${response?.data}');

      // If the response is valid, parse the data
      return SearchMovieResponseModel.fromJson(response?.data);
    } on DioException catch (e) {
      // Log the error
      print('Error fetching data: ${e.message}');
      throw Exception('Failed to fetch data: ${e.message}');
    }
  }
}
