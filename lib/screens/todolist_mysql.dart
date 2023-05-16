import 'package:flutter/material.dart';
import 'package:myapp/Utils/Drawer.dart';
import 'package:myapp/screens/tododetail.dart';
import 'package:mysql1/mysql1.dart';

import '../models/todo.dart';

class TodoListMysql extends StatefulWidget {
  const TodoListMysql({super.key});

  @override
  State<TodoListMysql> createState() => _TodoListMysqlState();
}

class _TodoListMysqlState extends State<TodoListMysql> {
  bool isObsecure = false;
  bool isEdit = false;
  late Todo editableTodo;
  List<Todo> MysqlTodolist = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String title = "";
  late MySqlConnection conn;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  @override
  void initState() {
    mysqlconn();
    super.initState();
  }

  @override
  void dispose() {
    conn.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isEdit ? Icons.save : Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          isEdit ? updateTodo() : addTodo();
          setState(() {
            isEdit = false;
          });
        },
      ),
      drawer: const MyDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("TodoList"),
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: Form(
                autovalidateMode: _autovalidateMode,
                key: formKey,
                child: TextFormField(
                  controller: titleController,
                  obscureText: isObsecure,
                  onSaved: (newValue) {
                    title = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Boş geçilemez';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Başlık',
                    labelText: 'Başlık giriniz.',
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                      child: Icon(
                          isObsecure ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                itemCount: MysqlTodolist.length,
                itemBuilder: (BuildContext context, int index) {
                  Todo item = MysqlTodolist[index];
                  return ListTile(
                    tileColor:
                        item.isComplated ? Colors.green[100] : Colors.red[100],
                    title: Text(
                      "#${item.id} - ${item.title}",
                      style: TextStyle(
                        decoration: item.isComplated
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: InkWell(
                      child: const Text("Tıkla ve görevi tamamla!"),
                      onTap: () {
                        setState(() {
                          item.isComplated = !item.isComplated;
                          updateIsComp(item.id, item.isComplated);
                          // MysqlTodolist = [];
                        });
                      },
                    ),
                    leading: item.isComplated
                        ? const Icon(Icons.check_box_outlined)
                        : const Icon(Icons.check_box_outline_blank),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              item.isStar = !item.isStar!;
                              updateIsStar(item.id, item.isStar!);
                            });
                          },
                          child: Icon(
                            item.isStar! ? Icons.star : Icons.star_border,
                            color: item.isStar! ? Colors.amber : null,
                          ),
                        ),
                        InkWell(
                          child: Icon(Icons.edit,
                              color: isEdit && editableTodo == item
                                  ? Colors.teal
                                  : null),
                          onTap: () {
                            setState(() {
                              isEdit = !isEdit;
                              editableTodo = item;
                              if (isEdit) {
                                titleController.text = editableTodo.title;
                              } else {
                                titleController.text = "";
                              }
                            });
                          },
                        ),
                        InkWell(
                          child: const Icon(Icons.close),
                          onTap: () {
                            setState(() {
                              deleteTodo(item.id);
                              // MysqlTodolist = [];
                              MysqlTodolist.remove(item);
                            });
                          },
                        ),
                        InkWell(
                          child: const Icon(Icons.more_vert),
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TodoDetail(todo: item)));
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  static Future<MySqlConnection> db() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        /*host: '93.89.225.127',
        port: 3306,
        user: 'ideftp1_testus',
        db: 'ideftp1_testdb',
        password: '123456aA+-'*/
        
        host: '94.73.150.186',
        port: 3306,
        user: 'infame_online_deneme',
        db: 'infame_online_todo',
        password: 'A1#-fCrWk?2DXleB8y'
        
         
        /*host: 'db4free.net',
        port: 3306,
        user: 'launcher_d_admin',
        db: 'deneme_launcher',
        password: '123456789a'*/));
    return conn;
  }

  void addTodo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      alertSuccess("Kayıt Eklendi!");
      final conn = await db();
      await conn.query(
          'insert into todo (title, iscomplated, isstar) values (?, ?, ?)',
          [title, false, false]);
      var results = await conn.query("select * from todo");
      setState(() {
        MysqlTodolist = [];
        for (var element in results) {
          MysqlTodolist.add(Todo(
              id: element["id"],
              title: element["title"],
              isComplated: element["iscomplated"] == 1 ? true : false));
        }
      });
      conn.close();
      debugPrint(MysqlTodolist.toString());
      formKey.currentState!.reset();
      titleController.text = "";
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  Future updateTodo() async {
    alertSuccess("Kayıt Güncellendi!");
    final conn = await db();
    conn.query("update todo set title =? where id=?",
        [titleController.text, editableTodo.id]);
    MysqlTodolist.map((e) => {
          if (e == editableTodo)
            {
              setState(() {
                e.title = titleController.text;
              })
            }
        }).toList();
    titleController.text = "";
  }

  void updateIsComp(int id, bool iscomplated) async {
    final conn = await db();
    await conn
        .query('update todo set iscomplated=? where id=?', [iscomplated, id]);
  }

  void updateIsStar(int id, bool isstar) async {
    final conn = await db();
    await conn.query('update todo set isstar=? where id=?', [isstar, id]);
  }

  void deleteTodo(int id) async {
    final conn = await db();
    await conn.query('delete from todo where id = ?', [id]);
  }

  void mysqlconn() async {
    debugPrint("Bağlanmaya çalıştı");
    final conn = await db();
    var results = await conn.query("select * from todo");
    debugPrint(results.toString());

    setState(() {
      MysqlTodolist = [];
      for (var element in results) {
        MysqlTodolist.add(Todo(
            id: element["id"],
            title: element["title"],
            isComplated: element["iscomplated"] == 1 ? true : false,
            isStar: element["isstar"] == null || element["isstar"] == 0
                ? false
                : true));
      }
    });
  }

  void alertSuccess(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kapat"),
                ),
              ],
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 72,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(message)),
                  ],
                ),
              ),
            ));
  }
}
