import 'package:flutter/material.dart';
import 'package:home/new_app/data/extensions.dart';
import '/core/widget/app_text/text_styles.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.softWrap,
    this.style,
    this.padding,
  });
  final String? text;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (padding == null) {
      return Text(
        text.valide(),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        style: style ?? HomeTxStyle.gStyle14,
      );
    }
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.all(0),
      child: Text(
        text.valide(),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        style: style ?? HomeTxStyle.gStyle14,
      ),
    );
  }
}
