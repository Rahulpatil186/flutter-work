import 'package:flutter/material.dart';
import 'package:login_page/components/Mybutton.dart';
import 'package:login_page/components/Textfield.dart';
import 'package:login_page/components/squaretile.dart';R

void main() {
  runApp(login_page());
}

class login_page extends StatelessWidget {
  login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
    );
  }
}

class login extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void signin() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              //logo
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(height: 25),
              //username
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login Page",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              ),
              SizedBox(height: 25),
              Textfield(
                  controller: usernameController,
                  obscuretext: false,
                  hinttext: "enter username"),
              const SizedBox(
                height: 50,
                child: ColoredBox(color: Colors.black12),
              ),
              //password
              Textfield(
                  controller: passwordController,
                  obscuretext: true,
                  hinttext: "enter password"),
              SizedBox(height: 20),
              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "forgot password?",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 50),

              //sign in button
              Mybutton(onTap: signin),
              SizedBox(height: 25),
              //or continue with
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.0),
                      child: Text("or continue with"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              //google+apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  squaretile(imagepath: "lib/images/google.png"),

                  //sizedbox
                  SizedBox(width: 25),
                  //apple button
                  squaretile(imagepath: "lib/images/apple.png"),
                ],
              )
              //register
            ],
          ),
        ),
      ),
    );
  }
}
