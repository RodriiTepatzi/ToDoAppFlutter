import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/enums/language.dart';
import 'package:todo_flutter/providers/lang_provider.dart';
import 'package:todo_flutter/providers/task_provider.dart';
import 'package:todo_flutter/views/tab_bar_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => TaskProvider()),
        ChangeNotifierProvider(create:(_) => LangProvider(configuredLang: Language.es)),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainTabBarView(),
    );
  }
}
