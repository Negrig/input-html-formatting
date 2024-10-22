import 'package:flutter/material.dart';
import 'package:html_input_formatting/pages/context_menu_page.dart';
import 'package:html_input_formatting/pages/styled_input_page.dart';

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
            'Контекстное меню': const ContextMenuPage(),
            'Стилизация текста инпута': const StyledInputPage(),
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

const initialText =
    '<b> Hi </b> how are you. <i> I am busy with work</i> <br> We will meet tomorrow.';
