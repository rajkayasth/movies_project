import '../../../utils/exports.dart';

@RoutePage()
class NoInternetPage extends BaseResponsiveView {
  const NoInternetPage({required this.onTryAgain, super.key});

  final Function() onTryAgain;

  @override
  Widget buildDesktopWidget(BuildContext context) =>
      _buildView(context,);

  @override
  Widget buildMobileWidget(BuildContext context) =>
      _buildView(context,);

  @override
  Widget buildTabletWidget(BuildContext context) =>
      _buildView(context,);

  Widget _buildView(BuildContext context) =>
      NoInternetWidget(
        onTryAgain: onTryAgain,
        childWidget: const SizedBox(),
      );
}
