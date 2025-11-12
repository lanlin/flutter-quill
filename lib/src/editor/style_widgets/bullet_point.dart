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
    final fontSize = style.fontSize ?? 16;
    final lineHeight = style.height ?? 1.0;
    final baselineOffset = fontSize * 0.5;

    final indent = attrs[Attribute.indent.key];
    final indentLevel = indent?.value ?? 0;
    final leftPadding = indentLevel * fontSize;

    return Container(
      alignment: AlignmentDirectional.topStart,
      width: width,
      padding:
          EdgeInsetsDirectional.only(start: leftPadding, top: baselineOffset),
      child: Text('•',
          style: style.copyWith(height: 1.0), textAlign: TextAlign.left),
    );
  }
}
