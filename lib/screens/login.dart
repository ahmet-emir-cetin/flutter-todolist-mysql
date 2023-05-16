import 'package:flutter/material.dart';

import '../Utils/Drawer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late bool pwd = true;
  late bool pwd_repeat = true;
  @override
  Widget build(BuildContext context) {
    //  double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            // constraints:const BoxConstraints(maxHeight: 200,maxWidth: 400,minWidth:350),
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            padding: const EdgeInsets.only(top: 15.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.supervised_user_circle_rounded,
                  size: 50,
                  color: Colors.white,
                ),
                Text("Hello",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text("Lorem ipsum dolar sit amet",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              // color: Colors.teal[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 390, height: 10),
                  const Wrap(
                    children: <Widget>[
                      SizedBox(
                        width: 124,
                        height: 30,
                        child: Text(
                          "Sign in",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 124,
                        height: 30,
                        child: Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 124,
                        height: 30,
                        child: Text(
                          "Reset",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Wrap(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: "Enter your email",
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.teal,
                              )),
                        ),
                        TextFormField(
                          obscureText: pwd,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.teal,
                            ),
                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (pwd) {
                                      pwd = false;
                                    } else {
                                      pwd = true;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye)),
                          ),
                        ),
                        TextFormField(
                          obscureText: pwd_repeat,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Repeat password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.teal,
                            ),
                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (pwd_repeat) {
                                      pwd_repeat = false;
                                    } else {
                                      pwd_repeat = true;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye)),
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
