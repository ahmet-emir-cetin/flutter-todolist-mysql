import 'package:flutter/material.dart';
import '../Utils/Drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> bodyList = [
    const Text("Ana Sayfa"),
    const Text("Kurumsal"),
    const Text("İletişim"),
    const Text("Ayarlar"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Hoşgeldiniz"),
      ),
      body: Center(
        child: bodyList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.teal : Colors.black38,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
              color: _selectedIndex == 1 ? Colors.teal : Colors.black38,
            ),
            label: 'Kurumsal',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone,
              color: _selectedIndex == 2 ? Colors.teal : Colors.black38,
            ),
            label: 'İletişim',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _selectedIndex == 3 ? Colors.teal : Colors.black38,
            ),
            label: 'Ayarlar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
