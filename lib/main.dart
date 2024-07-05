import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_hoa_atun/constants.dart';
import 'package:tap_hoa_atun/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tạp hóa A Tủn',
      theme: ThemeData(
        fontFamily: GoogleFonts.pangolin().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
    );
  }

  int _seconds = 1;
  Timer? _timer;

  void startTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Menu()));
        }
      });
    });
  }
}
