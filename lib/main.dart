import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/home/data/datasources/home_remote_data_source.dart';
import 'package:my_profile/features/home/data/repositories/home_repositories_impl.dart';
import 'package:my_profile/main_screen.dart';
import 'core/theme/app_thime.dart';

import 'firebase_options.dart';
import 'ingection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        debugShowCheckedModeBanner: false,
        theme: ScreenHelper.isDesktop(context)
            ? AppTheme.themeDesktop
            : AppTheme.themeMobile,
        home: const MainScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    getD();
  }

  void getD() async {
    final m = await HomeRepositoriesImpl(
            remoteDataSource:
                HomeRemoteDataSourceImpl(firebase: FirebaseFirestore.instance))
        .getHomeData();
    m.fold((failuer) {
      debugPrint("Failuer");
      debugPrint(failuer.toString());
    }, (posts) {
      debugPrint("Successes");
      debugPrint(posts.name);
      debugPrint(posts.career);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
