import 'package:flutter/material.dart';
import 'package:html_input_formatting/stylable_textfield/stylable_textfield_controller.dart';

class StyledInputPage extends StatelessWidget {
  const StyledInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        StyleableTextFieldController(
      styles: TextPartStyleDefinitions(
        definitionList: <TextPartStyleDefinition>[
          TextPartStyleDefinition(
            pattern: '[\.,\?\!]',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextPartStyleDefinition(
            style: const TextStyle(
              color: Colors.blue,
            ),
            pattern: '(?:(the|a|an) +)',
          ),
        ],
      ),
    );

    return Column(
      children: [
        Text('Enter the/a/an/!/?'),
        TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your text here...',
          ),
          autocorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.none,
        ),
      ],
    );
  }
}
