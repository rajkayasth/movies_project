import '../../../utils/exports.dart';

class MovieListState extends Equatable {
  final String? errorMsg;
  final BaseStateStatus status; // non-nullable
  final int? page;
  final ScrollController? scrollController;
  final List<Results>? movieList;
  final List<PostApiResponse>? postList;
  final bool? isPaginationApiCall;
  final bool? hasMoreData;
  final bool? isLoadingMore;

  const MovieListState({
    this.errorMsg,
    this.movieList,
    this.page,
    this.hasMoreData,
    this.scrollController,
    this.isPaginationApiCall,
    this.postList,
    this.isLoadingMore,
    this.status = BaseStateStatus.initial, // Default value for status
  });

  // Factory constructor to return an initial state
  factory MovieListState.initial() {
    return MovieListState(
      errorMsg: null,
      isPaginationApiCall: false,
      isLoadingMore: true,
      hasMoreData: false,
      movieList: [],
      postList: [],
      scrollController: ScrollController(),
      page: 1,
      status: BaseStateStatus.initial, // Set default value to initial
    );
  }

  @override
  List<dynamic> get props => [
        errorMsg,
        status,
        movieList,
        isLoadingMore,
        page,
        postList,
        scrollController,
    hasMoreData,
        isPaginationApiCall,
      ];

  MovieListState copyWith({
    BaseStateStatus? status, // Nullable status in copyWith
    int? page,
    List<Results>? movieList,
    List<PostApiResponse>? postList,
    ScrollController? scrollController,
    String? errorMsg,
    bool? isPaginationApiCall,
    bool? hasMoreData,
    bool? isLoadingMore,
  }) {
    return MovieListState(
      status: status ?? this.status,
      // If null, keep existing status
      errorMsg: errorMsg ?? this.errorMsg,
      page: page ?? this.page,
      movieList: movieList ?? this.movieList,
      scrollController: scrollController ?? this.scrollController,
      postList: postList ?? this.postList,
      isPaginationApiCall: isPaginationApiCall ?? this.isPaginationApiCall,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
