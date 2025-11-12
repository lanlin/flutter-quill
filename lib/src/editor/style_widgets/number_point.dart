import 'package:flutter/widgets.dart';
import '../../../flutter_quill.dart';

class QuillNumberPoint extends StatelessWidget {
  const QuillNumberPoint({
    required this.index,
    required this.indentLevelCounts,
    required this.count,
    required this.style,
    required this.width,
    required this.attrs,
    this.textAlign,
    this.withDot = true,
    this.padding = 0.0,
    super.key,
    this.backgroundColor,
  });

  final String index;
  final Map<int?, int> indentLevelCounts;
  final int count;
  final TextStyle style;
  final double width;
  final Map<String, Attribute> attrs;
  final bool withDot;
  final double padding;
  final Color? backgroundColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final numberText = withDot ? '$index.' : index;
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
    print(
        '🔢 [QuillNumberPoint] index: $index, fontSize: $fontSize, height: $height, effectiveHeight: ${effectiveStyle.height}');

    return Container(
      alignment: AlignmentDirectional.topStart,
      width: width,
      padding: EdgeInsetsDirectional.only(start: leftPadding, end: padding),
      child: Text(numberText, style: effectiveStyle, textAlign: TextAlign.left),
    );
  }
}
