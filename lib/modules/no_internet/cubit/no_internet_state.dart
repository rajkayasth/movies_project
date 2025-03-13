import '../../../utils/exports.dart';

class NoInternetState extends Equatable {
  const NoInternetState({
    this.status = BaseStateStatus.initial,
    this.isInternetConnected = true,
  });

  final bool isInternetConnected;
  final BaseStateStatus status;

  @override
  List<Object?> get props => <Object?>[
        status,
        isInternetConnected,
      ];

  NoInternetState copyWith({
    BaseStateStatus? status,
    String? msg,
    PageRouteInfo<dynamic>? redirectRoute,
    bool? isInternetConnected,
  }) =>
      NoInternetState(
        status: status ?? this.status,
        isInternetConnected: isInternetConnected ?? this.isInternetConnected,
      );
}
