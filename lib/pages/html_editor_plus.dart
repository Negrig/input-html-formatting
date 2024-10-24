import 'package:flutter/material.dart';
import 'package:html_editor_plus/html_editor.dart';
import 'package:html_input_formatting/main.dart';

class HtmlEditorPlus extends StatelessWidget {
  HtmlEditorPlus({super.key});

  final HtmlEditorController controller1 = HtmlEditorController();
  final HtmlEditorController controller2 = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Полный функционал редактора', style: TextStyle(fontSize: 24),),
        SizedBox(
          height: 300,
          child: HtmlEditor(
            controller: controller1,
            htmlEditorOptions: const HtmlEditorOptions(
              hint: "Your text here...",
              initialText: htmlText,
            ),
          ),
        ),
        const Spacer(),
        const Text('Пример кастомизации инструментов редактора', style: TextStyle(fontSize: 24),),
        SizedBox(
          height: 250,
          child: HtmlEditor(
            htmlToolbarOptions: const HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.belowEditor,
              buttonColor: Colors.red,
              buttonFillColor: Colors.green,
              dropdownBackgroundColor: Colors.blue,
              renderSeparatorWidget: false,
              toolbarItemHeight: 36,
              defaultToolbarButtons: [
                ParagraphButtons(
                  caseConverter: false,
                  lineHeight: false,
                  textDirection: false,
                ),
                OtherButtons(
                  codeview: false,
                  copy: false,
                  fullscreen: false,
                  help: false,
                  paste: false,
                ),
                FontSettingButtons(
                  fontName: false,
                  fontSizeUnit: false,
                ),
                ListButtons(
                  listStyles: false,
                ),
              ],
            ),
            controller: controller2,
            htmlEditorOptions: HtmlEditorOptions(
              mobileContextMenu: ContextMenu(
                menuItems: [
                  ContextMenuItem(
                    title: 'SOME_CUSTOM_ACTION',
                    androidId: 1
                  )
                ],
              ),
              hint: "Your text here...",
              initialText: htmlText,
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
