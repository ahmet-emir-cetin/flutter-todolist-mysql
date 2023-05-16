import 'package:flutter/material.dart';
import 'package:myapp/screens/calc.dart';
import 'package:myapp/screens/counter.dart';
import 'package:myapp/screens/fs.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/nalan.dart';
import 'package:myapp/screens/todolist.dart';
import 'package:myapp/screens/toplama.dart';
import 'screens/todolist_mysql.dart';
// import 'screens/calc.dart';

// import 'screens/nalan.dart';
// import 'screens/toplama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "TodoList",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        // home: const TodoListMysql()
        initialRoute: '/',
        routes: {
          "/":(context) => const Home(),
          "/todolistdb":(context) => const TodoListMysql(),
          "/calc":(context) => const Calculator(),
          "/counter":(context) => const Counter(),
          "/fs":(context) => const FontSize(),
          "/login":(context) => const LoginForm(),
          "/nalan":(context) => const Nalan(),
          "/toplama":(context) => const Toplama(),
          "/todo":(context) => const TodoList(),
        },
        );
  }
}
