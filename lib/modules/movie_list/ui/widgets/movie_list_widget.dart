import 'package:flutter/cupertino.dart';

import '../../../../utils/exports.dart';

class MovieListWidget extends BaseResponsiveView {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  buildDesktopWidget(BuildContext context) {
    return _pageView(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _pageView(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _pageView(context);
  }

  _pageView(BuildContext ctx) {
    return BlocBuilder<MovieListCubit, MovieListState>(
      buildWhen: (previous, current) {
        return true;
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(

              backgroundColor: Theme.of(context).colorScheme.inversePrimary,

            title: Text("Movie List"),
          ),
          body: MovieListGridWidget(),
        );
      },
    );
  }
}
