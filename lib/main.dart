import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_mobile/core/injection/index.dart';
import 'package:pss_mobile/core/providers/user.provider.dart';
import 'package:pss_mobile/screens/profile.dart';
import 'package:pss_mobile/widgets/autoLogin/autoLogin.dart';
import 'package:pss_mobile/widgets/bottomNavigation/index.dart';
import 'package:pss_mobile/widgets/loadingOverlay/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  return runZonedGuarded(() async {
    runApp(const MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  List<Widget> widgetList = <Widget>[
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  void _onChangeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Get.find();

    return GetMaterialApp(
      title: 'Flutter Base',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.grey[200],
          primaryColorLight: Colors.blue,
          primaryColorDark: Colors.black54,
          textTheme: const TextTheme(
            labelSmall: TextStyle(fontSize: 8),
          )),
      home: LoadingOverlay(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Base flutter'),
          ),
          body: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: AutoLogin(children: widgetList[_currentIndex]),
          ),
          bottomNavigationBar: Obx(
            () => userProvider.isLogin.value
                ? CBottomNavigationBar(
                    currentIndex: _currentIndex,
                    onChangeTab: _onChangeTab,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
