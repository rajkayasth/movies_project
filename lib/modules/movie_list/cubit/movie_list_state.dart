import '../../../utils/exports.dart';

class MovieListState extends Equatable {
  final String? errorMsg;
  final BaseStateStatus status; // non-nullable
  final int? page;
  final List<Results>? movieList;
  final List<PostApiResponse>? postList;

  const MovieListState({
    this.errorMsg,
    this.movieList,
    this.page,
    this.postList,
    this.status = BaseStateStatus.initial, // Default value for status
  });

  // Factory constructor to return an initial state
  factory MovieListState.initial() {
    return const MovieListState(
      errorMsg: null,
      movieList: [],
      postList: [],
      page: 1,
      status: BaseStateStatus.initial, // Set default value to initial
    );
  }

  @override
  List<dynamic> get props => [errorMsg, status, movieList, page,postList];

  MovieListState copyWith({
    BaseStateStatus? status, // Nullable status in copyWith
    int? page,
    List<Results>? movieList,
    List<PostApiResponse>? postList,
    String? errorMsg,
  }) {
    return MovieListState(
      status: status ?? this.status, // If null, keep existing status
      errorMsg: errorMsg ?? this.errorMsg,
      page: page ?? this.page,
      movieList: movieList ?? this.movieList,
      postList: postList ?? this.postList,
    );
  }
}
