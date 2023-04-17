import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive/hive.dart';
import 'package:inside_training/app/pages/login/login_view.dart';
import 'package:inside_training/app/pages/rounder_app.dart';
import 'package:inside_training/app_theme.dart';
import 'package:inside_training/generated/l10n.dart';
import 'package:inside_training/leguage_changes_provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_localizations/flutter_localizations.dart';
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
  final RouterApp _router = RouterApp();

  @override
  void initState() {
    super.initState();
    initLogger();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
        providers: [
          Provider<LenguageChangeProvider>(create: (_) => LenguageChangeProvider()),
        ],
        child: Builder(
          builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme().theme(),
            localizationsDelegates: const [
              S.delegate,
              FormBuilderLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: Provider.of<LenguageChangeProvider>(context, listen:true).currentLocale,
            supportedLocales: S.delegate.supportedLocales,
            home: const LoginPage(),
            onGenerateRoute: _router.getRoute,
            navigatorObservers: [_router.routeObserver],
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
