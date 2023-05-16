import 'package:flutter/material.dart';

import '../Utils/Drawer.dart';

class FontSize extends StatefulWidget {
  const FontSize({super.key});

  @override
  State<FontSize> createState() => _FontSizeState();
}

double fontSize = 12;

class _FontSizeState extends State<FontSize> {
  @override
  void azalt() {
    setState(() {
      fontSize--;
    });
  }

  void arttir() {
    setState(() {
      fontSize++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Font Size"),
        actions: [
          InkWell(
            child: const Icon(Icons.font_download, size: 16),
            onTap: () {
              azalt();
            },
          ),
          InkWell(
            child: const Icon(Icons.font_download, size: 24),
            onTap: () {
              arttir();
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Merhaba",
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
