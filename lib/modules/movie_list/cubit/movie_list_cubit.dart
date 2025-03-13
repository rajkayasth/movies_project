import '../../../custom/custom_snackbar_widget.dart';
import '../../../utils/exports.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MoviesListRepositoryImpl _repository() => MoviesListRepositoryImpl();
  bool _isLoadingMore = false;
  bool hasMoreData = true;

  MovieListCubit()
      : super(
          MovieListState.initial(),
        ) {
    // _handleApiCall();

    Future<void>.microtask(
      () async => getMovieDetailApiCall(pageNumber: 1),
    );
    setupScrollListener();
    /* Future<void>.microtask(
      () async => getPostListApiCall(),
    );*/
  }

  /// Sets up the scroll listener for detecting when the user reaches the end of the list.
  /// It triggers loading more data if there is more data to load and the user has
  /// scrolled near the bottom of the list.
  void setupScrollListener() {
    state.scrollController?.addListener(
      () async {
        if (state.scrollController != null &&
            state.scrollController!.position.pixels >=
                (state.scrollController!.position.maxScrollExtent -
                    AppConstant.maxScrollExtent) &&
            hasMoreData &&
            !_isLoadingMore) {
          if (!_isLoadingMore && hasMoreData) {
            _isLoadingMore = true;
            await getMovieDetailApiCall(pageNumber: state.page ?? 1);
            // _isLoadingMore = false;
          }
        }
      },
    );
  }

  Future<void> getMovieDetailApiCall({required int pageNumber}) async {
    try {
      // Call the repository to get the movies list
      if (!_isLoadingMore) {
        _isLoadingMore = true;
      }

      emit(state.copyWith(
        status: BaseStateStatus.loading,
        isPaginationApiCall: _isLoadingMore
      ));
      final response = await _repository().getMoviesList(
        pageNumber: pageNumber,
      );

      int page = state.page ?? 1;

      if (response != null) {
        // If the response is not null, extract the movie list and update state
        final List<Results>? movieList = response.results;

        if ((state.page ?? 1) <= (response.totalPages ?? 0)) {
          // Proceed if the current page is within the total pages
          page++;
          hasMoreData = true;
          _isLoadingMore = false;
        }

        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            page: page,
            hasMoreData: hasMoreData,
            isPaginationApiCall: _isLoadingMore,
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
