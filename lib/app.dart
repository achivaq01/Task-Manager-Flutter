import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'classes/app_data.dart';
import 'layouts/layout.dart';

class App extends StatefulWidget{
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();

}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);

    return MaterialApp(
      theme: appData.theme,
      home: const Layout(),
      debugShowCheckedModeBanner: false,
    );
  }

}