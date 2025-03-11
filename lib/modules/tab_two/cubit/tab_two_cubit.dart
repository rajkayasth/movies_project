import '../../../utils/exports.dart';

class TabTwoCubit extends Cubit<TabTwoState> {
  static TabTwoCubit instance() => TabTwoCubit();

  TabTwoCubit()
      : super(const TabTwoState(status: BaseStateStatus.initial));


  ///handle go to detail page click
  handleGoToDetailPage(BuildContext context) {
    context.router.pushNamed(AppPaths.tabTwoDetail);
  }


}
