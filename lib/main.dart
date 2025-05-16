import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/services/dependencies.dart' as dep;
import 'package:portfolio/screens/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.initDep();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    dep.getAllMethods();
    return GetMaterialApp(
      title: 'Ojo Mutiu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}
