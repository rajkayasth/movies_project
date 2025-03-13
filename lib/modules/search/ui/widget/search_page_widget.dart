import '../../../../base/custom_network_image_widget.dart';
import '../../../../utils/exports.dart';

class SearchWidget extends BaseResponsiveView {
  const SearchWidget({super.key});

  @override
  buildDesktopWidget(BuildContext context) {
    return _buildViews(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _buildViews(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _buildViews(context);
  }

  _buildViews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller:
                context.instance<SearchCubit>().state.textEditingController,
            onChanged: (query) =>
                {context.instance<SearchCubit>().searchMovies(query)},
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state.movies?.isEmpty ?? false) {
                  return const Center(child: Text('No results found'));
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: state.scrollController,
                        itemCount: state.movies?.length,
                        itemBuilder: (context, index) {
                          final movie = state.movies?[index];
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12.0),
                              ),
                              child: CustomNetworkImageWidget(
                                imageUrl:
                                "${ApiConst.imageBaseUrl}${movie?.posterPath}",
                                width: 100,
                                placeHolderImage:
                                "assets/images/ic_placeholder.jpg",
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              movie?.title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,

                            ),
                            subtitle: Text(
                              movie?.overview.toString() ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // Navigate to movie details
                            },
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
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
