import '../../../utils/exports.dart';

class TabTwoState extends Equatable {
  final BaseStateStatus status;

  const TabTwoState({this.status = BaseStateStatus.initial});

  @override
  List<dynamic> get props => [status];
}
