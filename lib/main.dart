import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_clone/screens/base/base_screen.dart';
import 'package:xlo_clone/stores/category_store.dart';
import 'package:xlo_clone/stores/page_store.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'Sk4XozAucNCpfeyS1pokhB3k5QRjbA0ZMTtqhLWg',
    'https://parseapi.back4app.com/',
    clientKey: 'YoeMHL8HCtUBVGDZjPi3KfVpV5d7P802xZPlcH99',
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'XLO',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.purple,
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
          ),
          cursorColor: Colors.orange,
        ),
        home: BaseScreen(),
      );
}
