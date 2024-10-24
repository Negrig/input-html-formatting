import 'package:flutter/material.dart';
import 'package:html_input_formatting/main.dart';
import 'package:light_html_editor/light_html_editor.dart';

class LightHtmlEditor extends StatelessWidget {
  const LightHtmlEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: LightHtmlRichTextEditor(
            alwaysShowButtons: true,
            placeholders: [
              RichTextPlaceholder(
                "VAR",
                "Some longer text that got shortened!",
              ),
            ],
            initialValue: htmlText,
            onChanged: (String html) {
              print(html);
            },
          ),
        ),
      ],
    );
  }
}
