import 'package:flutter/material.dart';

class LoginForm02 extends StatefulWidget {
  const LoginForm02({super.key});

  @override
  State<LoginForm02> createState() => _LoginForm02State();
}

class _LoginForm02State extends State<LoginForm02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          constraints: const BoxConstraints(maxHeight: 400, minHeight: 400),
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                    decoration: const InputDecoration(
                      
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: "Enter your email",
                        labelText: "Merhaba",
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: "Enter your password",
                        labelText: "Merhaba",
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
