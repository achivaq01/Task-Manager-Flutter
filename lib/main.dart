import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'classes/app_data.dart';
import 'constants.dart';

Future<void> main() async {
  try {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Task (
          id INTEGER PRIMARY KEY,
          name VARCHAR(255),
          finished INTEGER DEFAULT 0
      )
      ''');

    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      WidgetsFlutterBinding.ensureInitialized();
      await WindowManager.instance.ensureInitialized();
      windowManager.waitUntilReadyToShow().then(showWindow);
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  runApp(ChangeNotifierProvider(
    create: (context) => AppData(),
    child: const App(),
  ));
}

void showWindow(_) async {
  windowManager.setMinimumSize(const Size(minWindowHeight, minWindowWidth));
  await windowManager.setTitle(appName);
}
