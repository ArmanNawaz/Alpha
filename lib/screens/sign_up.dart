import 'package:alpha/screens/verify_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void showInSnackBar({required String value, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white)),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      elevation: 5.0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF4A249E),
        appBar: AppBar(
          backgroundColor: Color(0xFF4A249E),
          elevation: 0,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(50),
              width: size.width,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFF4A249E),
                image: DecorationImage(
                  image: AssetImage('assets/united-bg.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: username,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 24)),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: password,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 24),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: confirmPassword,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 24),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: InkWell(
                onTap: () {
                  if (username.text.trim().isEmpty) {
                    showInSnackBar(
                        value: 'Please input username', context: context);
                  } else if (password.text.trim().isEmpty) {
                    showInSnackBar(
                        value: 'Please input password', context: context);
                  } else if (confirmPassword.text.trim().isEmpty) {
                    showInSnackBar(
                        value: 'Please confirm your password',
                        context: context);
                  } else if (password.text.trim() !=
                      confirmPassword.text.trim()) {
                    showInSnackBar(
                        value: 'Password mismatched', context: context);
                  } else {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => VerifyOTP()));
                  }
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
