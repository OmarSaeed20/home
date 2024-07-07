import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '/core/network/base/typedef/typedef.dart';
import '/new_app/app_prefs.dart';

extension DateTimeExtensions on String? {
  String viewLang([BuildContext? context]) => isLTR ? "en" : "ar";
  /*  View.of(context ?? Get.context!)
      .platformDispatcher
      .locale
      .languageCode
      .toLowerCase(); */
  bool get isLTR => Get.find<NewAppAppPreferences>().getLang == "en";
  translateDatabase(String? en) {
    if (!isLTR) {
      return toString().valide();
    } else {
      return en.toString().valide();
    }
  }

  printy() {
    // if (kDebugMode) debugPrint(this);
    debugPrint(this);
  }

  String get appDateFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('d/M/y', viewLang()).format(DateTime.parse(this!));
  }

  String get chatDateFormat {
    if (this == null) {
      return '';
    }

    return DateFormat(' d MMM', viewLang()).format(DateTime.parse(this!));
  }

  String get formatDate {
    if (this == null) {
      return '';
    }

    return DateFormat('hh:mm a', viewLang()).format(DateTime.parse(this!));
  }

  String get chatDateWithTimeFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('', viewLang()).add_jm().format(DateTime.parse(this!));
  }

  String get dayMonFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('d MMM', viewLang())
        .add_jm()
        .format(DateTime.parse(this!));
  }

  bool get isEmptyOrNul =>
      this == null ||
      (this != null && this!.isEmpty) ||
      (this != null && this! == 'null');

  // Check null string, return given value if null
  String valide({String value = ''}) {
    if (isEmptyOrNul) return value;
    return this!;
  }
}

extension TextEditingControllerExtension on TextEditingController {
  String? controller(TextEditingController ctrl) =>
      ctrl.text.isNotEmpty ? text : null;

  TextEditingController copyWith({String? text}) =>
      TextEditingController(text: text ?? this.text);
}

extension InttExtensionn on int {
  String get getDurationReminder {
    if (toString().length == 1) return '0$this';
    return '$this';
  }
}

gPadding({
  double left = 0,
  double top = 0,
  double right = 0,
  double bottom = 0,
}) =>
    EdgeInsetsDirectional.only(
      end: left.w,
      top: top.h,
      start: right.w,
      bottom: bottom.h,
    );

gPaddingSymmetric({double horizontal = 0, double vertical = 0}) =>
    EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w);
gPaddingAll(double all) =>
    EdgeInsets.symmetric(vertical: all.h, horizontal: all.w);

extension BorderRadiusExtension on num {
  BorderRadius get radius => BorderRadius.circular(toDouble().r);
  BorderRadius get radiusAll => BorderRadius.all(toDouble().radiusCircular);
  Radius get radiusCircular => Radius.circular(toDouble().r);
}

extension SizedBoxExtension on num {
  SizedBox get sH => SizedBox(height: toDouble().h);
  SizedBox get sW => SizedBox(width: toDouble().w);
}

extension WidgetsExtension on Widget? {
  /// add custom corner radius each side
  ClipRRect radiusWithClipRRectOnly({
    int bottomLeft = 0,
    int bottomRight = 0,
    int topLeft = 0,
    int topRight = 0,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft.toDouble()),
          bottomRight: Radius.circular(bottomRight.toDouble()),
          topLeft: Radius.circular(topLeft.toDouble()),
          topRight: Radius.circular(topRight.toDouble()),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: this,
      );

  /// add corner radius
  ClipRRect radiusWithClipRRect(double radius) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: this,
      );
}

extension HExtension on num {
  double fh(BuildContext context, [double? figSize]) =>
      context.height * (toDouble() / (figSize ?? 812));
  double fw(BuildContext context, [double? figSize]) =>
      context.width * (toDouble() / (figSize ?? 375));
}

extension EdgeInsetsDirectionallExtension on num {
  ///? `Only`
  EdgeInsetsDirectional get padTop =>
      EdgeInsetsDirectional.only(top: toDouble().h);
  EdgeInsetsDirectional get padBtm =>
      EdgeInsetsDirectional.only(bottom: toDouble().h);
  EdgeInsetsDirectional get padSt =>
      EdgeInsetsDirectional.only(start: toDouble().w);
  EdgeInsetsDirectional get padEnd =>
      EdgeInsetsDirectional.only(end: toDouble().w);

  ///? `All`
  EdgeInsetsDirectional get padAll => EdgeInsetsDirectional.all(toDouble().h);

  ///? `Symmetric`
  EdgeInsetsDirectional get padHorizontal =>
      EdgeInsetsDirectional.symmetric(horizontal: toDouble().w);
  EdgeInsetsDirectional get padVertical =>
      EdgeInsetsDirectional.symmetric(vertical: toDouble().h);
}

extension JsonExtension on JSON {
  String gString(String key, {String defaultValue = ""}) =>
      switch (containsKey("username")) {
        true => switch (containsKey(key)) {
            true => this[key] ?? "",
            false => "",
          },
        false => this[key] ?? "",
      };

  int gInt(String key, {int defaultValue = 0}) =>
      switch (containsKey("username")) {
        true => switch (containsKey(key)) {
            true => this[key] ?? 0,
            false => 0,
          },
        false => this[key] ?? 0,
      };

  double gDouble(String key) => double.parse((this[key] ?? 0.0).toString());

  bool gBool(String key) => this[key] as bool? ?? false;

  Color hexToColor(String key) {
    if (!containsKey(key)) return Colors.transparent;
    // Remove the hash (#) if it exists
    key = key.replaceAll("#", "");
    if (key.length == 6) {
      key = "FF$key";
    }
    // Convert the hex color code to a Color object
    int colorInt = int.parse(key, radix: 16);
    // int colorInt = int.parse(hexColor, radix: 16);
    return Color(colorInt);
  }

  List<String> getAttributeList(String key) {
    final dynamic value = this[key];
    if (value != null) {
      if (value is List) {
        return value.map<String>((e) => e.toString()).toList();
      } else {
        return [value.toString()];
      }
    } else {
      return [];
    }
  }

  /* List<Color> getColorList(String key) {
    final dynamic value = this[key];
    if (value != null && value is List) {
      return value
          .map<Color>((data) => ColorsFormated.fromJson(data as JSON).code)
          .toList();
    } else {
      return [];
    }
  } */
}
