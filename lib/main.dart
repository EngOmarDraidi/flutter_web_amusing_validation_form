import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Calendar { day, week, month, year }

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // colorSchemeSeed: Colors.black,
        fontFamily: 'Ubuntu',
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Colors.black, secondary: Colors.white),
      ),
      home: const LoginScreen(),
    );
  }
}
