import 'package:flutter/material.dart';
import '/core/consts/app_colors.dart';

class ShowLoading {
  open({
    required BuildContext context,
    GlobalKey? key,
  }) {
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    RoundedRectangleBorder defaultDialogShape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)));
    return showDialog<void>(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PopScope(
          onPopInvoked: (v) async => false,
          child: AnimatedPadding(
            key: key,
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 44.0),
            duration: insetAnimationDuration,
            curve: insetAnimationCurve,
            child: MediaQuery.removeViewInsets(
              removeLeft: true,
              removeTop: true,
              removeRight: true,
              removeBottom: true,
              context: context,
              child: Center(
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: Material(
                    elevation: 24.0,
                    color: Theme.of(context).dialogBackgroundColor,
                    type: MaterialType.card,
                    shape: defaultDialogShape,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          strokeWidth: 3.5,
                          valueColor: AlwaysStoppedAnimation(
                            KColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  close({BuildContext? context, required GlobalKey key}) {
    Navigator.of(key.currentContext!, rootNavigator: true).pop(); //
  }
}
