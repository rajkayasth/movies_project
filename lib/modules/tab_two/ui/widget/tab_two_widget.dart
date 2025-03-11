import '../../../../utils/exports.dart';

class TabTwoWidget extends BaseResponsiveView {
  const TabTwoWidget({Key? key}) : super(key: key);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.instance<TabTwoCubit>().handleGoToDetailPage(context);
          },
          child: Text(
            "Search Page",
          ),
        ),
      ],
    );
  }
}
