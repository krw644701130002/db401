import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: shades());
  }
}

class shades extends StatefulWidget {
  const shades({super.key});

  @override
  State<shades> createState() => _shadesState();
}

class _shadesState extends State<shades> {
  int _shades = 744318;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          print(details.globalPosition.dy);
        });
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          paint(context, details);
        });
      },
      child: Scaffold(
        backgroundColor: Color(0XFF00FFFF + _shades),
      ),
    );
  }

  void paint(context, details) {
    double maxScr = MediaQuery.of(context).size.height;
    double yPos = details.globalPosition.dy;
    _shades = (yPos / maxScr * 16777215).round();
    if (_shades > 16777215) _shades = 16777215;
    //print(_shades);
  }
}
