import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/src/provider.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory appDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);

  runZonedGuarded(() {
    runApp(const MyApp());
  }, ((Object error, StackTrace stack) {}));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // todo: crear RouterApp

  @override
  void initState() {
    super.initState();
    initLogger();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
        providers: [],
        child: Builder(
          builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Container(),
          );
        }));
  }

  void initLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord record) {
      final dynamic e = record.error;
      final String m = /*e is Exception ? e.message :*/ e.toString();

      print(
          '${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
    });
    Logger.root.info('logger initialized.');
  }
}
