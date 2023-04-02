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
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_alpha.jpeg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          fontSize: 26,
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
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
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
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
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
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF174AFD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
