import 'package:flutter/material.dart';
import 'package:myapp/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}



//  initialRoute: '/',
//       routes: {
//         '/': (context) => SplashScreen(),
//         '/login': (context) => LoginPage(),
//         // Add more routes as needed
//       },
