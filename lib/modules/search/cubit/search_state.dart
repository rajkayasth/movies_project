import '../../../utils/exports.dart';

class SearchState extends Equatable {
  final BaseStateStatus status;
  final List<SearchResults>? movies;
  final ScrollController? scrollController;
  final bool? isPaginationApiCall;

  final TextEditingController? textEditingController;

  const SearchState(
      {this.movies,
      this.status = BaseStateStatus.initial,
      this.scrollController,
      this.isPaginationApiCall,
      this.textEditingController});

  factory SearchState.initial() => SearchState(
        movies: [],
        status: BaseStateStatus.initial,
      isPaginationApiCall:false,
        scrollController: ScrollController(),
        textEditingController: TextEditingController(),
      );

  @override
  List<dynamic> get props => [
        status,
        movies,
        textEditingController,
        scrollController,
    isPaginationApiCall,
      ];

  SearchState copyWith({
    BaseStateStatus? status,
    List<SearchResults>? movies,
    TextEditingController? textEditingController,
    ScrollController? scrollController,
    bool? isPaginationApiCall,
  }) {
    return SearchState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      isPaginationApiCall: isPaginationApiCall ?? this.isPaginationApiCall,
      scrollController: scrollController ?? this.scrollController,
      textEditingController:
          textEditingController ?? this.textEditingController,
    );
  }
}
