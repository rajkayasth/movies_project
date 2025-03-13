part of 'movie_detail_cubit.dart';

class MovieDetailState extends Equatable {
  final String? errorMsg;
  final BaseStateStatus status;
  final MovieDetailResponseModel? movieDetailResponseModel;

  const MovieDetailState({
    this.errorMsg,
    this.movieDetailResponseModel,
    this.status = BaseStateStatus.initial,
  });

  factory MovieDetailState.initial() {
    return MovieDetailState(status: BaseStateStatus.initial);
  }

  MovieDetailState copyWith({
    String? errorMsg,
    BaseStateStatus? status,
    MovieDetailResponseModel? movieDetailResponseModel,
  }) {
    return MovieDetailState(
      errorMsg: errorMsg ?? this.errorMsg,
      status: status ?? this.status,
      movieDetailResponseModel:
          movieDetailResponseModel ?? this.movieDetailResponseModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMsg,
        movieDetailResponseModel,
      ];
}
