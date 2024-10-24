// import 'package:flutter/material.dart';
// import 'package:html_input_formatting/main.dart';
// import 'package:quill_html_editor/quill_html_editor.dart';
//
// class QuillHtmlEditorPage extends StatelessWidget {
//   QuillHtmlEditorPage({super.key});
//   final QuillEditorController controller = QuillEditorController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ToolBar(
//           toolBarColor: Colors.cyan.shade50,
//           activeIconColor: Colors.green,
//           padding: const EdgeInsets.all(8),
//           iconSize: 20,
//           controller: controller,
//           customButtons: [
//             InkWell(onTap: () {}, child: const Icon(Icons.favorite)),
//             InkWell(onTap: () {}, child: const Icon(Icons.add_circle)),
//           ],
//         ),
//         QuillHtmlEditor(
//           text: htmlText,
//           hintText: 'Hint text goes here',
//           controller: controller,
//           isEnabled: true,
//           minHeight: 300,
//           textStyle: const TextStyle(color: Colors.blue),
//           hintTextStyle: const TextStyle(color: Colors.orange),
//           hintTextAlign: TextAlign.start,
//           padding: const EdgeInsets.only(left: 10, top: 5),
//           hintTextPadding: EdgeInsets.zero,
//           backgroundColor: Colors.white,
//           onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
//           onTextChanged: (text) => debugPrint('widget text change $text'),
//           onEditorCreated: () => debugPrint('Editor has been loaded'),
//           onEditingComplete: (s) => debugPrint('Editing completed $s'),
//           onEditorResized: (height) =>
//               debugPrint('Editor resized $height'),
//           onSelectionChanged: (sel) =>
//               debugPrint('${sel.index},${sel.length}'),
//           loadingBuilder: (context) {
//             return const Center(
//                 child: CircularProgressIndicator(
//                   strokeWidth: 0.4,
//                 ));},
//         ),
//       ],
//     );
//   }
// }
