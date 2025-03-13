import 'package:movie_project/base/custom_network_image_widget.dart';

import '../../../../utils/exports.dart';

class MovieDetailWidget extends BaseResponsiveView {

  final String movieId;

  const MovieDetailWidget({super.key, required this.movieId});

  @override
  buildDesktopWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _buildView(context);
  }

  Widget _buildView([BuildContext? context]) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Movies Details'),
      ),
      body: NoInternetWidget(
        onTryAgain: () {
          context?.instance<MovieDetailCubit>().getMovieDetail(movieId: movieId);
        },
        childWidget: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if(state.status == BaseStateStatus.loading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CustomNetworkImageWidget(
                      imageUrl:
                          "${ApiConst.imageBaseUrl}${state.movieDetailResponseModel?.posterPath}",
                      width: double.infinity,
                      height: 500,
                      placeHolderImage: "assets/images/ic_placeholder.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.movieDetailResponseModel?.originalTitle ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.movieDetailResponseModel?.overview ?? "",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '${state.movieDetailResponseModel?.voteAverage}/10',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  /*const SizedBox(height: 24),
                  const InfoSection(
                    title: 'Starring',
                    items: [
                      'Robert Downey Jr.',
                      'Chris Evans',
                      'Mark Ruffalo',
                      'Chris Hemsworth',
                      'Scarlett Johansson'
                    ],
                  ),*/
                  const SizedBox(height: 16),
                   InfoSection(
                    title: 'Release Date(s)',
                    items: [state.movieDetailResponseModel?.releaseDate ?? ""],
                  ),
                  const SizedBox(height: 16),
                   InfoSection(
                    title: 'popularity',
                     items: ["${state.movieDetailResponseModel?.popularity.toString()}/100"],
                  ),
                  const SizedBox(height: 16),
                   InfoSection(
                    title: 'Run Time',
                    items: [context.instance<MovieDetailCubit>().formatRuntime(minutes: state.movieDetailResponseModel?.runtime ?? 0)],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
