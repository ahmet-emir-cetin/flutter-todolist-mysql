import 'package:flutter/material.dart';

import '../Utils/Drawer.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _counter++;
              });
            }),
        drawer: const MyDrawer(),
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("Sayaç"),
          actions: const [
            Icon(Icons.settings),
            SizedBox(
              width: 5,
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _counter++;
                  });
                },
                child: Container(
                  color: Colors.green,
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  child: const Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(_counter.toString()),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _counter--;
                  });
                },
                child: Container(
                  color: Colors.red,
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  child: const Text(
                    "-",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        )

        // body: Container(
        //   alignment: Alignment.center,
        //   child: Text(_counter.toString()),
        // ),
        );
  }
}
