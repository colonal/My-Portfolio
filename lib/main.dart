import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/widget/helper/screen_helper.dart';
import 'main_screen.dart';
import 'core/theme/app_thime.dart';

import 'core/utils/my_custom_scroll_behavior.dart';
import 'firebase_options.dart';
import 'ingection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  await di.init();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        title: 'Colonal',
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ScreenHelper.isDesktop(context)
            ? AppTheme.themeDesktop
            : AppTheme.themeMobile,
        home: const MainScreen(),
      ),
    );
  }
}
