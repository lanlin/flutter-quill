import 'package:flutter/widgets.dart';
import '../../../flutter_quill.dart';

class QuillBulletPoint extends StatelessWidget {
  const QuillBulletPoint({
    required this.style,
    required this.width,
    this.padding = 0,
    this.backgroundColor,
    this.textAlign,
    this.attrs = const {},
    super.key,
  });

  final TextStyle style;
  final double width;
  final double padding;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final Map<String, Attribute> attrs;

  @override
  Widget build(BuildContext context) {
    final fontSize =
        style.fontSize ?? DefaultTextStyle.of(context).style.fontSize ?? 16.0;
    final height = style.height ?? DefaultTextStyle.of(context).style.height;

    final indent = attrs[Attribute.indent.key];
    final indentLevel = indent?.value ?? 0;
    final leftPadding = indentLevel * fontSize;

    final effectiveStyle = style.copyWith(
      height: height,
    );

    // Debug: print actual height value being used
    debugPrint(
        '[QuillBulletPoint] fontSize: $fontSize, height: $height, effectiveHeight: ${effectiveStyle.height}');

    return Container(
      alignment: AlignmentDirectional.topStart,
      width: width,
      padding: EdgeInsetsDirectional.only(start: leftPadding, end: padding),
      child: Text('•', style: effectiveStyle, textAlign: TextAlign.center),
    );
  }
}
