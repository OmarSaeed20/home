import 'package:equatable/equatable.dart';
import '/core/util/keys.dart';

import '/core/util/enums.dart';

class NewAppChooseLanguageState extends Equatable {
  const NewAppChooseLanguageState({
    this.lang = Keys.ar,
    this.rx = RequestState.none,
  });
  final String lang;
  final RequestState rx;

  NewAppChooseLanguageState copyWith({String? lang, RequestState? rx}) =>
      NewAppChooseLanguageState(lang: lang ?? this.lang, rx: rx ?? this.rx);

  @override
  List<Object?> get props => [lang, rx];
}
