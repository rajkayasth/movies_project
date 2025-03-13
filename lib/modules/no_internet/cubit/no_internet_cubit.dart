import '../../../utils/exports.dart';

class InternetCubit extends Cubit<NoInternetState> {

  InternetCubit(this._connectivity) : super(const NoInternetState()) {
    _monitorConnectivity();
  }
  final Connectivity _connectivity;

  void _monitorConnectivity() {
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> event) {
      bool isConnected = event.any((result) =>
      result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi);

      emit(
        state.copyWith(
          status: isConnected ? BaseStateStatus.success : BaseStateStatus.failure,
          isInternetConnected: isConnected,
        ),
      );
    });
  }


  Future<bool> checkConnectivity() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();

    bool isConnected = results.any((result) =>
    result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi);

    emit(
      state.copyWith(
        status: isConnected ? BaseStateStatus.success : BaseStateStatus.failure,
        isInternetConnected: isConnected,
      ),
    );

    return isConnected;
  }

  @override
  NoInternetState getResetErrorState() => state.copyWith(msg: '');

  @override
  NoInternetState getResetRedirectionState() => state.copyWith();
}
