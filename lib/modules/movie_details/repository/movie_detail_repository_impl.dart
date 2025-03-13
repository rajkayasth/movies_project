import '../../../../utils/exports.dart';

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  @override
  Future<MovieDetailResponseModel>? getMovieDetail({
    required String movieID,
  }) async {
    try {
      final response = await MainConfig.apiClient.get(
        "${Apis.movie}$movieID",
      );
      // Log response data for debugging
      print('API Response Data: ${response?.data}');

      // If the response is valid, parse the data
      return MovieDetailResponseModel.fromJson(response?.data);
    } on DioException catch (e) {
      // Log the error
      print('Error fetching data: ${e.message}');
      throw Exception('Failed to fetch data: ${e.message}');
    }
  }
}
