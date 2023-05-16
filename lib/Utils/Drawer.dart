import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent[100],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/amed.jpg"),
                  ),
                ],
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushNamed(context, "/");

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_chart),
            title: const Text('Calculator'),
            onTap: () {
              Navigator.pushNamed(context, "/calc");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_chart),
            title: const Text('Counter'),
            onTap: () {
              Navigator.pushNamed(context, "/counter");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_chart),
            title: const Text('FonstSize'),
            onTap: () {
              Navigator.pushNamed(context, "/fs");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Todo List'),
            onTap: () {
              Navigator.pushNamed(context, "/todo");

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.dataset),
            title: const Text('TodoListMySql'),
            onTap: () {
              Navigator.pushNamed(context, "/todolistdb");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, "/login");
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}