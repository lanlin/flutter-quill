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

    return Container(
      alignment: AlignmentDirectional.centerEnd,
      width: width,
      padding: EdgeInsetsDirectional.only(end: padding),
      child: Baseline(
        baseline: (style.fontSize ?? 16) * (style.height ?? 1.0) * 0.8,
        baselineType: TextBaseline.alphabetic,
        child: Text(numberText, style: style, textAlign: textAlign),
      ),
    );
  }
}
