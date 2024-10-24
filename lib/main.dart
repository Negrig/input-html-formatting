import 'package:flutter/material.dart';
import 'package:html_input_formatting/pages/context_menu_page.dart';
import 'package:html_input_formatting/pages/html_editor_plus.dart';
import 'package:html_input_formatting/pages/quill_html_editor.dart';
import 'package:html_input_formatting/pages/light_html_editor.dart';
import 'package:html_input_formatting/pages/styled_input_page.dart';

const String htmlText = '<p><b>Это пример</b> <u>случайного текста</u>, <h1>который</h1> <span style="color:#ff0000;">содержит</span> <i><u><u>различные</u></u> HTML-теги</i>. <s>Этот текст зачеркнут</s>, <b>этот жирный</b>, а этот с <u style="color:#9900ff;">подчеркиванием</u></p>';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Варианты форматирования HTML'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: {
            'Редактор 3': HtmlEditorPlus(),
            // 'Контекстное меню': const ContextMenuPage(),
            // 'Стилизация текста инпута': const StyledInputPage(),
            // 'Редактор 1': QuillHtmlEditorPage(),
            // 'Редактор 2': const LightHtmlEditor(),
          }.map((key, value) => MapEntry(
            key,
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: Text(key)),
                      body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: value,
                      ),
                    );
                  },
                ));
              },
              child: Text(key),
            ),
          )).values.toList(),
        ),
      ),
    );
  }
}