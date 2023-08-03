import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fooddeliveryapp/welcome/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontSize: 55,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              displayMedium: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold))),
      home: const SplashScreen(),
    );
  }
}
