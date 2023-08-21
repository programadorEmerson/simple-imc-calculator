import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imccalculator/models/imc.dart';
import 'package:imccalculator/pages/login.dart';
import 'package:imccalculator/repositories/imc.repository.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ImcModelAdapter());
  ImcRepository.openBox();
  runApp(const MyApp());
}
