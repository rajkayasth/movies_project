import 'package:movie_project/base/custom_network_image_widget.dart';

import '../../../../utils/exports.dart';

class MovieListGridWidget extends StatelessWidget {
  const MovieListGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth ~/ 200).clamp(2, 4);
        return BlocBuilder<MovieListCubit, MovieListState>(
          builder: (context, state) {
            if(state == BaseStateStatus.loading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state == BaseStateStatus.success){
              return Visibility(
                visible: (state.movieList?.isNotEmpty ?? false),
                replacement: Center(
                  child: Text("No Data Found"),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: state.movieList?.length,
                  itemBuilder: (context, index) {
                    final product = state.movieList?[index];
                    /* if (index >= state.products.length) {
                  return _buildShimmerEffect();
                }*/
                    return Card(
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
                              placeHolderImage: "assets/images/ic_placeholder.jpg",
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product?.title ?? "",
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
                    );
                  },
                ),
              );
            }
            return  Center(
              child: Text("No Data Found"),
            );
          },
        );
      },
    );
  }
}
