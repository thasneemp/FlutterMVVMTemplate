import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm/routes/routes.dart';
import 'package:flutter_mvvm/stores/theme_store.dart';
import 'package:flutter_mvvm/ui/screens/spalsh_screen.dart';
import 'package:provider/provider.dart';

import '../appconstants/strings.dart';

class BaseApp extends StatelessWidget {
  BaseApp({Key? key}) : super(key: key);

  //Initializing theme here
  final ThemeStore _themeStore = ThemeStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => _themeStore)],
      child: Observer(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            routes: Routes.routes,
            home: SplashScreen(),
          );
        },
        name: "global_observer",
      ),
    );
  }
}
