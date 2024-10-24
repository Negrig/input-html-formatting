import 'package:flutter/material.dart';
import 'package:html_input_formatting/stylable_textfield/stylable_textfield_controller.dart';

class StyledInputPage extends StatelessWidget {
  const StyledInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        StyleableTextFieldController(
          text: 'Try to write italic or bold words here!',
      styles: TextPartStyleDefinitions(
        definitionList: <TextPartStyleDefinition>[
          TextPartStyleDefinition(
            pattern: 'bold', // '[\.,\?\!]',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextPartStyleDefinition(
            style: const TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.italic,
            ),
            pattern: 'italic', // '(?:(the|a|an) +)',
          ),
        ],
      ),
    );

    return Column(
      children: [
        TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            // hintText: 'Enter your text here...',
          ),
          autocorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.none,
        ),
      ],
    );
  }
}
