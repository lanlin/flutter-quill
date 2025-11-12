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
    final fontSize = style.fontSize ?? 16;
    final lineHeight = style.height ?? 1.0;
    final baselineOffset = fontSize * 0.5;

    final indent = attrs[Attribute.indent.key];
    final indentLevel = indent?.value ?? 0;
    final leftPadding = indentLevel * fontSize;

    return Container(
      alignment: AlignmentDirectional.topStart,
      width: width,
      padding: EdgeInsetsDirectional.only(
          start: leftPadding, end: padding, top: baselineOffset),
      child: Text(numberText,
          style: style.copyWith(height: 1.0), textAlign: TextAlign.left),
    );
  }
}
