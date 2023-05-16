import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  const TodoDetail({required this.todo, super.key});
  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.todo.title} detay"),
        actions: const [],
      ),
      body: const Center(
        child: Text("Başlık"),
      ),
    );
  }
}
