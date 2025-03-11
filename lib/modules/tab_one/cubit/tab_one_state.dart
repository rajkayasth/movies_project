import '../../../utils/exports.dart';

class TabOneState extends Equatable {
  final String? errorMsg;
  final BaseStateStatus status;

  const TabOneState({
    this.errorMsg,
    this.status = BaseStateStatus.initial,
  });

  @override
  List<dynamic> get props => [errorMsg, status];

  TabOneState copyWith(BaseStateStatus status, {String? errorMsg}) {
    return TabOneState(
      status: status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
