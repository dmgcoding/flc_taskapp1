import 'package:flc_taskapp1/locator.dart';
import 'package:flc_taskapp1/pages/home/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

//create a packages folder
//go into that folder
//run flutter/dart command to create a new package

//command
//flutter create --template=package task_repository
//dart create --template=package task_repository
