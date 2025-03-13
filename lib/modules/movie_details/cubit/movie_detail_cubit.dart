import '../../../custom/custom_snackbar_widget.dart';
import '../../../utils/exports.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final String movieId;
  final MovieDetailRepositoryImpl movieDetailRepositoryImpl;

  MovieDetailCubit({
    required this.movieId,
    required this.movieDetailRepositoryImpl,
  }) : super(
          MovieDetailState.initial(),
        ) {
    Future.microtask(() async => await getMovieDetail(
          movieId: movieId,
        ));
  }

  Future<void> getMovieDetail({required String movieId}) async {
    try {
      // Call the repository to get the movies list

      emit(state.copyWith(
        status: BaseStateStatus.loading,
      ));
      final response = await movieDetailRepositoryImpl.getMovieDetail(
        movieID: movieId,
      );

      if (response != null) {
        // If the response is not null, extract the movie list and update state
        final MovieDetailResponseModel? movieDetailResponse = response;

        if (movieDetailResponse != null) {
          emit(
            state.copyWith(
                status: BaseStateStatus.success,
                movieDetailResponseModel: movieDetailResponse),
          );
        } else {
          // If the response is null, set to error or empty state
          emit(state.copyWith(
            status: BaseStateStatus.failure,
            errorMsg: "Failed to fetch movies",
          ));
        }
      } else {
        // If the response is null, set to error or empty state
        emit(state.copyWith(
          status: BaseStateStatus.failure,
          errorMsg: "Failed to fetch movies",
        ));
      }
    } catch (e) {
      // In case of an error, show error state and log the error
      emit(
        state.copyWith(
          status: BaseStateStatus.failure,
          errorMsg: "Error: ${e.toString()}",
        ),
      );
      displaySnackBar(e.toString() ?? "", MainConfig.context);

      print('Error fetching movie details: $e');
    }
  }

  String formatRuntime({required int minutes}) {
    if (minutes <= 0) return "Unknown";

    final int hours = minutes ~/ 60; // Integer division to get hours
    final int remainingMinutes = minutes % 60; // Modulus to get remaining minutes

    if (hours > 0 && remainingMinutes > 0) {
      return "$hours hour${hours > 1 ? 's' : ''} $remainingMinutes minute${remainingMinutes > 1 ? 's' : ''}";
    } else if (hours > 0) {
      return "$hours hour${hours > 1 ? 's' : ''}";
    } else {
      return "$remainingMinutes minute${remainingMinutes > 1 ? 's' : ''}";
    }
  }
}
