import '../utils/exports.dart';

// ignore: must_be_immutable
abstract class BaseResponsiveView extends StatelessWidget {
  const BaseResponsiveView({super.key});

  buildMobileWidget(BuildContext context);

  buildTabletWidget(BuildContext context);

  buildDesktopWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(builder: (context, constraints) {
        if (_isMobileView(context)) {
          return buildMobileWidget(context);
        } else if (_isTabletView(context)) {
          return buildTabletWidget(context);
        } else if (_isWebView(context)) {
          return buildDesktopWidget(context);
        } else {
          return const SizedBox();
        }
      }),
    );
  }

  ///Making these methods static, so that they can be used as accessed from other widgets
  ///web view if size equal or more than 1200 pixels
  static bool _isWebView(BuildContext context) {
    return context.width >= AppConstant.webPixelWidth;
  }

  ///mobile view if is less than 550 pixels
  static bool _isMobileView(BuildContext context) {
    return context.width < AppConstant.mobilePixelWidth;
  }

  ///web view if is more than 550 and less than 880
  static bool _isTabletView(BuildContext context) {
    return context.width >= AppConstant.mobilePixelWidth &&
        context.width < AppConstant.webPixelWidth;
  }
}
