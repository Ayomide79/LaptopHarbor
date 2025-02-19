import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';  // ✅ Import Firebase
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase Initialization Error: $e");
  }
  runApp(const LaptopHaborApp());
}

class LaptopHaborApp extends StatelessWidget {
  const LaptopHaborApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaptopHabor',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }
}
