import 'package:flutter/material.dart';

class StandardSubtitleText extends StatelessWidget {
  const StandardSubtitleText(
    this.text, {
    super.key,
    this.overflow,
  });

  final String text;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium,
      overflow: overflow ?? TextOverflow.fade,
    );
  }
}

class StandardBodyText extends StatelessWidget {
  const StandardBodyText(
    this.text, {
    super.key,
    this.color,
    this.padding,
    this.textAlign,
    this.textOverflow,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        overflow: textOverflow ?? TextOverflow.clip,
        textAlign: textAlign ?? TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: color, fontWeight: fontWeight),
      ),
    );
  }
}

class StandardHeadlineText extends StatelessWidget {
  const StandardHeadlineText(
    this.text, {
    super.key,
    this.color,
    this.padding,
    this.textAlign,
    this.textOverflow,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        overflow: textOverflow ?? TextOverflow.clip,
        textAlign: textAlign ?? TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: color, fontWeight: fontWeight),
      ),
    );
  }
}
