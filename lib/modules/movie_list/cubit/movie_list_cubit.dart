import '../../../custom/custom_snackbar_widget.dart';
import '../../../utils/exports.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MoviesListRepositoryImpl _repository() => MoviesListRepositoryImpl();

  MovieListCubit()
      : super(
          MovieListState.initial(),
        ) {
    // _handleApiCall();

    /*Future<void>.microtask(() async => getMovieDetailApiCall(),);*/

    Future<void>.microtask(
      () async => getPostListApiCall(),
    );
  }

  Future<void> getMovieDetailApiCall() async {
    try {
      // Call the repository to get the movies list

      emit(state.copyWith(
        status: BaseStateStatus.loading,
      ));
      final response =
          await _repository().getMoviesList(pageNumber: state.page ?? 1);

      if (response != null) {
        // If the response is not null, extract the movie list and update state
        final List<Results>? movieList = response.results;

        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            movieList: [
              ...(state.movieList ?? []),
              ...?movieList, // Safely merge lists
            ],
          ),
        );
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

  Future<void> getPostListApiCall() async {
    try {
      emit(state.copyWith(
        status: BaseStateStatus.loading,
      ));

      // Call the repository to get the movies list
      final response = await _repository().getPostList();

      if (response != null) {
        // If the response is not null, extract the movie list and update state
        final List<PostApiResponse>? postList = response;

        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            postList: postList,
          ),
        );
      } else {
        // If the response is null, set to error or empty state
        emit(
          state.copyWith(
            status: BaseStateStatus.failure,
            errorMsg: "Failed to fetch movies",
          ),
        );
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

  ///handle redirection
  void handleRedirection(BuildContext context) {
    context.router.pushNamed(AppPaths.tabOneDetail);
  }
}
