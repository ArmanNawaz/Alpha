import 'package:alpha/constants.dart';
import 'package:alpha/screens/dashboard.dart';
import 'package:alpha/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Constants c = Constants();
  bool isLoading = false;

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
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_alpha.jpeg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 130),
              child: Container(
                height: 145,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/united.jpeg'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            c.createTextField(title: 'Username', controller: username),
            c.createTextField(
                title: 'Password', controller: password, isPassword: true),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Forgot Password',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                        value: 'PLease input password', context: context);
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(Duration(seconds: 3)).then((value) {
                      setState(() {
                        isLoading = false;
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(builder: (_) => Dashboard()),
                            (route) => false);
                      });
                    });
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
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                ),
              ),
            ),
            isLoading
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => SignUp()));
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF174AFD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'SignUp',
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
    ));
  }
}
