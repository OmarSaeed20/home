import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home/core/consts/app_colors.dart';
import '/core/util/keys.dart';
import '/new_app/data/model/newapp_services_mode.dart';

import '/core/util/enums.dart';

class NewAppMainState extends Equatable {
  const NewAppMainState({
    this.lang = Keys.ar,
    this.rx = RequestState.none,
    this.servcies = const [],
    this.colors = const [
      KColors.cirYallowBg,
      KColors.cirBlueBg,
      KColors.cirPinkBg,
    ],
  });
  final String lang;
  final List<Color> colors;

  final List<NewAppServicesDataMode> servcies;
  final RequestState rx;

  NewAppMainState copyWith({
    String? lang,
    RequestState? rx,
    List<Color>? colors,
    List<NewAppServicesDataMode>? servcies,
  }) =>
      NewAppMainState(
        lang: lang ?? this.lang,
        colors: colors ?? this.colors,
        rx: rx ?? this.rx,
        servcies: servcies ?? this.servcies,
      );

  @override
  List<Object?> get props => [lang, rx, servcies,colors];
}
