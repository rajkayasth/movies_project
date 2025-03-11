import '../../../utils/exports.dart';

class TabOneCubit extends Cubit<TabOneState> {
  static TabOneCubit instance() => TabOneCubit();

  TabOneRepositoryImpl _repository() => TabOneRepositoryImpl();

  TabOneCubit()
      : super(
          const TabOneState(
            status: BaseStateStatus.initial,
          ),
        ) {
   // _handleApiCall();
  }

 /* ///handle api call
  void _handleApiCall() async {
    emit(state.copyWith(BaseStateStatus.loading));
    _repository().getUserDetails().then((value) {
      if (value.isSuccess()) {
        emit(TabOneState(
            userDetailResponse: value.getSuccessInstance()?.response,
            status: BaseStateStatus.success));
      } else if (value.isFailure()) {
        emit(TabOneState(
            userDetailResponse: null,
            errorMsg: MainConfig.context.appString.errorKey,
            status: BaseStateStatus.failure));
      }
    });
  }*/

  ///handle redirection
  void handleRedirection(BuildContext context) {
    context.router.pushNamed(AppPaths.tabOneDetail);
  }
}
