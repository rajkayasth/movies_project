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
            if (state.status == BaseStateStatus.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.status == BaseStateStatus.success) {
              return Visibility(
                visible: (state.postList?.isNotEmpty ?? false),
                replacement: Center(
                  child: Text("No Data Found"),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.60,
                  ),
                  itemCount: state.postList?.length,
                  itemBuilder: (context, index) {
                    final product = state.postList?[index];
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
                                  "https://images.unsplash.com/photo-1682114964475-89d82ea5eae4?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHVybHxlbnwwfHwwfHx8MA%3D%3D",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    product?.body ?? "",
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
            return Center(
              child: Text("No Data Found"),
            );
          },
        );
      },
    );
  }
}
