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
      height: 1,
    );

    // Calculate baseline offset to align bullet with first line text
    // Formula: fontSize * (lineHeight - 1.0) * 0.7
    // The coefficient 0.7 ensures proper alignment across different font sizes
    // - When lineHeight = 1.6, extra space = fontSize * 0.6
    // - Offset = fontSize * 0.6 * 0.7 ≈ fontSize * 0.42 (pushes bullet down)
    final baselineOffset =
        height != null ? fontSize * (height - 1.0) * 0.7 : 0.0;

    return Container(
      width: width,
      padding: EdgeInsetsDirectional.only(
        start: leftPadding,
        end: padding,
        top: baselineOffset,
      ),
      child: Text('•', style: effectiveStyle, textAlign: TextAlign.left),
    );
  }
}
