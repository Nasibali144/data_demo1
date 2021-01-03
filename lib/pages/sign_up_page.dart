import 'package:data_demo1/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {

  static final String id = 'sign_up_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  void _doSignUp() async {
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();

    var box = Hive.box('task_one');

    box.put('username', username);
    box.put('password', password);
    box.put('email', email);
    box.put('phone', phone);

    print(box.get('username'));
    print(box.get('password'));
    print(box.get('email'));
    print(box.get('phone'));

    Navigator.pushNamed(context, HomePage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1a1d3a),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 140,),
              // #create account
              Text('Create', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.1),),
              Text('Account', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.1),),
              SizedBox(height: 60,),
              // #username
              TextField(
                controller: usernameController,
                style: TextStyle(color: Colors.grey[400]),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                  ),
                  prefixIcon: Icon(Icons.person_outlined, color: Colors.grey[400],),
                  hintText: 'User Name',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
              SizedBox(height: 20,),

              // #email
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.grey[400]),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                  ),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[400],),
                  hintText: 'E-Mail',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
              SizedBox(height: 20,),

              // #phone
              TextField(
                controller: phoneController,
                style: TextStyle(color: Colors.grey[400]),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                  ),
                  prefixIcon: Icon(Icons.local_phone_outlined, color: Colors.grey[400],),
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
              SizedBox(height: 20,),

              // #passworw
              TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.grey[400]),
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400], width: 1.0)
                    ),
                    prefixIcon: Icon(Icons.vpn_key_outlined, color: Colors.grey[400],),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: 'Password'
                ),
              ),
              SizedBox(height: 50,),


              // #navigator
              GestureDetector(
                onTap: _doSignUp,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.lightBlueAccent.shade100.withOpacity(0.9),
                            Colors.lightBlue.shade400.withOpacity(0.9),
                            Colors.lightBlue.shade700.withOpacity(0.9),
                            Colors.blueAccent.shade700.withOpacity(0.9),
                          ]
                      )
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white, size: 37,),
                ),
              ),
              SizedBox(height: 80,),

              // #sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: TextStyle(color: Colors.grey.shade500),),
                  GestureDetector(
                    child: Text('SIGN IN', style: TextStyle(color: Colors.blue),),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignInPage.id);
                    },
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
