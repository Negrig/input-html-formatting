import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenuPage extends StatefulWidget {
  const ContextMenuPage({super.key});

  @override
  _ContextMenuPageState createState() => _ContextMenuPageState();
}

class _ContextMenuPageState extends State<ContextMenuPage> {
  final TextEditingController _controller = TextEditingController(text: 'Select this text!');
  final FocusNode _focusNode = FocusNode();
  TextSelection? _selection;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final selection = _controller.selection;
    if (selection != _selection) {
      setState(() {
        _selection = selection;
      });
    }
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _selection = null;
      });
    }
  }

  void _onApplyHtmlTag(String tag) {
    if (_selection == null || _selection!.isCollapsed) return;

    final start = _selection!.start;
    final end = _selection!.end;
    final text = _controller.text;

    final selectedText = text.substring(start, end);
    final newText =
        '${text.substring(0, start)}<$tag>$selectedText</$tag>${text.substring(end)}';

    setState(() {
      _controller.text = newText;
      _controller.selection = TextSelection.collapsed(
          offset:
              start + tag.length + 2 + selectedText.length + tag.length + 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your text here...',
              ),
              selectionControls: MaterialTextSelectionControls(),
            ),
            const SizedBox(height: 50),
          ],
        ),
        if (_selection != null &&
            !_selection!.isCollapsed &&
            _focusNode.hasFocus)
          Positioned(
            bottom: 0,
            left: 0,
            child: _ContextMenu(_onApplyHtmlTag),
          ),
      ],
    );
  }
}

class _ContextMenu extends StatelessWidget {
  const _ContextMenu(this._onApplyHtmlTag, {super.key});
  final Function(String) _onApplyHtmlTag;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.format_bold),
            onPressed: () => _onApplyHtmlTag('b'),
          ),
          IconButton(
            icon: const Icon(Icons.format_italic),
            onPressed: () => _onApplyHtmlTag('i'),
          ),
          IconButton(
            icon: const Icon(Icons.format_strikethrough),
            onPressed: () => _onApplyHtmlTag('s'),
          ),
          IconButton(
            icon: const Icon(Icons.format_underlined),
            onPressed: () => _onApplyHtmlTag('u'),
          ),
        ],
      ),
    );
  }
}
