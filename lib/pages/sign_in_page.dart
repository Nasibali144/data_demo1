import 'package:data_demo1/pages/home_page.dart';
import 'package:data_demo1/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignInPage extends StatefulWidget {

  static final String id = 'sign_in_page';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doSignIn() async {
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box('task_one');

    box.put('username', username);
    box.put('password', password);

    print(box.get('username'));
    print(box.get('password'));

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
            SizedBox(height: 150,),
            // #avatar
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
            SizedBox(height: 20,),

            //#welcome
            Text('Welcome Back!', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),),
            SizedBox(height: 5,),
            Text('Sign in to continue', style: TextStyle(color: Colors.grey[200], fontSize: 16),),
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
            SizedBox(height: 25,),

            // #text
            Text('Forgot Password?', style: TextStyle(color: Colors.grey.shade400, fontSize: 13),),
            SizedBox(height: 50,),

            // #navigator
            GestureDetector(
              onTap: _doSignIn,
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
            SizedBox(height: 100,),

            // #sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ", style: TextStyle(color: Colors.grey.shade500),),
                GestureDetector(
                    child: Text('SIGN UP', style: TextStyle(color: Colors.blue),),
                  onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
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
