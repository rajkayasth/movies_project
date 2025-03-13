import 'package:movie_project/base/custom_network_image_widget.dart';

import '../../../../utils/exports.dart';

class MovieListGridWidget extends StatelessWidget {
  const MovieListGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth ~/ 200).clamp(2, 4);
        return NoInternetWidget(
          onTryAgain: () {
            context.instance<MovieListCubit>().getMovieDetailApiCall(pageNumber: 1);
          },
          childWidget: BlocBuilder<MovieListCubit, MovieListState>(
            builder: (context, state) {
              if (state.status == BaseStateStatus.loading && state.page == 1) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.isLoadingMore == false &&
                  (state.movieList?.isEmpty ?? true)) {
                return Center(
                  child: Text("No Data Found"),
                );
              }

              /*   if (state.status == BaseStateStatus.success) {*/
              return Visibility(
                visible: (state.movieList?.isNotEmpty ?? false),
                replacement: Center(
                  child: Text("No Data Found"),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: state.scrollController,
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 0.60,
                        ),
                        itemCount: state.movieList?.length,
                        itemBuilder: (context, index) {
                          final product = state.movieList?[index];
                          /* if (index >= state.products.length) {
                          return _buildShimmerEffect();
                        }*/
                          return InkWell(
                            onTap: () {
                              context.router.push(
                                MovieDetailRoute(
                                  movieId: product?.id.toString() ?? "",
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12.0),
                                    ),
                                    child: CustomNetworkImageWidget(
                                      imageUrl:
                                          "${ApiConst.imageBaseUrl}${product?.posterPath}",
                                      width: double.infinity,
                                      placeHolderImage:
                                          "assets/images/ic_placeholder.jpg",
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product?.title ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          Text(
                                            product?.overview ?? "",
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: state.isPaginationApiCall ?? false,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  ],
                ),
              );
              /* }*/
            },
          ),
        );
      },
    );
  }
}
