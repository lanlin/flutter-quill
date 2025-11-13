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
        style.fontSize ?? DefaultTextStyle.of(context).style.fontSize ?? 17.0;
    final height = style.height ?? DefaultTextStyle.of(context).style.height;

    final indent = attrs[Attribute.indent.key];
    final indentLevel = indent?.value ?? 0;
    final leftPadding = indentLevel * fontSize;

    final effectiveStyle = style.copyWith(
      height: 1,
    );

    // Calculate baseline offset to align bullet with first line text
    // Formula: fontSize * (lineHeight - 1.0) * coefficient
    // Coefficient adjusts for lineHeight change (1.6 → 1.29)
    // - When lineHeight = 1.29, extra space = fontSize * 0.29
    // - Coefficient ≈ 0.52 for proper alignment with new tighter spacing
    final baselineOffset =
        height != null ? fontSize * (height - 1.0) * 0.52 : 0.0;

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
