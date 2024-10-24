import 'package:flutter/material.dart';
import 'package:html_input_formatting/stylable_textfield/models.dart';

export './models.dart';

class StyleableTextFieldController extends TextEditingController {
  StyleableTextFieldController({
    required this.styles,
    super.text,
  }) : combinedPattern = styles.createCombinedPatternBasedOnStyleMap();

  final TextPartStyleDefinitions styles;
  final Pattern combinedPattern;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final List<InlineSpan> textSpanChildren = <InlineSpan>[];

    text.splitMapJoin(
      combinedPattern,
      onMatch: (Match match) {
        final String? textPart = match.group(0);

        if (textPart == null) return '';

        final TextPartStyleDefinition? styleDefinition =
        styles.getStyleOfTextPart(
          textPart,
          text,
        );

        if (styleDefinition == null) return '';

        _addTextSpan(
          textSpanChildren,
          textPart,
          style?.merge(styleDefinition.style),
        );

        return '';
      },
      onNonMatch: (String text) {
        _addTextSpan(textSpanChildren, text, style);

        return '';
      },
    );

    return TextSpan(style: style, children: textSpanChildren);
  }

  void _addTextSpan(
      List<InlineSpan> textSpanChildren,
      String? textToBeStyled,
      TextStyle? style,
      ) {
    textSpanChildren.add(
      TextSpan(
        text: textToBeStyled,
        style: style,
      ),
    );
  }
}
