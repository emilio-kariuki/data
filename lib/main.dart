import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp( );
  runApp(const GetMaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
