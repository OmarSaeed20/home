import 'package:equatable/equatable.dart';
import '/core/util/enums.dart';

class NewAppSplashState extends Equatable {
  const NewAppSplashState({this.rx = RequestState.none});

  final RequestState rx;

  NewAppSplashState copyWith({RequestState? rx}) =>
      NewAppSplashState(rx: rx ?? this.rx);

  @override
  List<Object> get props => [rx];
}
