import '../../../utils/exports.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepositoryImpl repository;
  Timer? _debounce;
  bool _isLoadingMore = false;
  bool hasMoreData = true;
  int page = 1;
  String searchTerm = "";

  static SearchCubit instance({
    required SearchRepositoryImpl repository,
  }) =>
      SearchCubit(
        repository: repository,
      );

  SearchCubit({required this.repository}) : super(SearchState.initial()) {
    setupScrollListener();
  }

  void setupScrollListener() {
  /*  state.scrollController?.addListener(
      () async {
        if (state.scrollController != null &&
            state.scrollController!.position.pixels >=
                (state.scrollController!.position.maxScrollExtent -
                    AppConstant.maxScrollExtent) &&
            hasMoreData &&
            !_isLoadingMore) {
          if (!_isLoadingMore && hasMoreData) {
            _isLoadingMore = true;
            if(searchTerm !=state.textEditingController?.text ){
              page = 1;
            }
            searchMovies(state.textEditingController?.text ?? "");
            // _isLoadingMore = false;
          }
        }
      },
    );*/
  }

  void searchMovies(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    if(searchTerm !=state.textEditingController?.text ){
      page = 1;
    }
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if (!_isLoadingMore) {
        _isLoadingMore = true;
      }

      emit(state.copyWith(
          status: BaseStateStatus.loading,
          isPaginationApiCall: _isLoadingMore));
      try {
        final results = await repository.getMoviesList(
          pageNumber: page,
          searchParam: query,
        );

        if (results != null) {
          final moviesList = results.results;
          searchTerm = query;

          if ((page ?? 1) <= (results.totalPages ?? 0)) {
            // Proceed if the current page is within the total pages
            page++;
            hasMoreData = true;
            _isLoadingMore = false;
          }
          emit(
            state.copyWith(
              isPaginationApiCall: _isLoadingMore,

              status: BaseStateStatus.success,
              movies: moviesList,
            ),
          );
        }
      } catch (_) {
        emit(state.copyWith(status: BaseStateStatus.failure));
      }
    });
  }

  ///handle go to detail page click
  handleGoToDetailPage(BuildContext context) {
    context.router.pushNamed(AppPaths.tabTwoDetail);
  }
}
