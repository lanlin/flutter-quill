import 'package:flutter/widgets.dart';

class QuillBulletPoint extends StatelessWidget {
  const QuillBulletPoint({
    required this.style,
    required this.width,
    this.padding = 0,
    this.backgroundColor,
    this.textAlign,
    super.key,
  });

  final TextStyle style;
  final double width;
  final double padding;
  final Color? backgroundColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final fontSize = style.fontSize ?? 16;
    final lineHeight = style.height ?? 1.0;
    final baselineOffset = fontSize * 0.7;

    return Container(
      alignment: AlignmentDirectional.topEnd,
      width: width,
      padding: EdgeInsetsDirectional.only(end: padding, top: baselineOffset),
      child:
          Text('•', style: style.copyWith(height: 1.0), textAlign: textAlign),
    );
  }
}
