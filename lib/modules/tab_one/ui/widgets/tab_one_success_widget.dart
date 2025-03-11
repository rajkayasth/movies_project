import '../../../../utils/exports.dart';

class TabOneSuccessWidget extends BaseResponsiveView {
  const TabOneSuccessWidget({Key? key}) : super(key: key);

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
    return BlocBuilder<TabOneCubit, TabOneState>(
      buildWhen: (previous, current) {
        return true;
      }
      /*(current.status == BaseStateStatus.success &&
              current.userDetailResponse != null)*/
      ,
      builder: (BuildContext context, state) {
        return Visibility(
          visible: true,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
                onTap: () {
                  context.instance<TabOneCubit>().handleRedirection(context);
                },
                child: Text("List Page")),
          ]),
        );
      },
    );
  }
}
