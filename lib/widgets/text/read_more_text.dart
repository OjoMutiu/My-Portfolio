import'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';

class ReadMoreTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? textStyle;
  final TextStyle? toggleStyle;
  final FontWeight? fontWeight;
  final double? fontSize, letterSpacing;
  final Color? textColor;
  final TextOverflow? textOverflow;

  const ReadMoreTextWidget({
    super.key,
    required this.text,
    this.maxLines = 4,
    this.textStyle,
    this.toggleStyle,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.textColor,
    this.textOverflow,
  });

  @override
  State<ReadMoreTextWidget> createState() => _ReadMoreTextWidgetState();
}

class _ReadMoreTextWidgetState extends State<ReadMoreTextWidget> {
  bool _readMore = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.text,
            style: widget.textStyle ?? TextStyle(
              fontFamily: "Sora",
              fontWeight: widget.fontWeight ?? FontWeight.w400,
              fontSize: AppDimens.fSize(widget.fontSize ?? 14),
              color: widget.textColor ?? AppColors.blackColor,
              letterSpacing: widget.letterSpacing,
            ),
          ),
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: widget.textStyle ?? TextStyle(
                fontFamily: "Sora",
                fontWeight: widget.fontWeight ?? FontWeight.w400,
                fontSize: AppDimens.fSize(widget.fontSize ?? 14),
                color: widget.textColor ?? AppColors.blackColor,
                letterSpacing: widget.letterSpacing,
              ),
              maxLines: _readMore ? null : widget.maxLines,
              overflow:
              _readMore ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            if (isOverflowing)
              GestureDetector(
                onTap: () => setState(() => _readMore = !_readMore),
                child: Text(
                  _readMore ? 'Read less' : 'Read more',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
