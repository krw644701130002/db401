import 'package:flutter/material.dart';

void main() {
  runApp(const MyPanel());
}

class MyPanel extends StatefulWidget {
  const MyPanel({super.key});

  @override
  State<MyPanel> createState() => _MypanelState();
}

class _MypanelState extends State<MyPanel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.webp'), fit: BoxFit.cover),
          ),
          child: const MyPanel(),
        ),
      ),
    );
  }
}
