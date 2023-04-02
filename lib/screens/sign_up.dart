import 'package:alpha/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController otp = TextEditingController();
  Constants c = Constants();
  bool enabled = true;
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        // width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_alpha.jpeg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40, horizontal: 130),
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
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            c.createTextField(
                title: 'Username', controller: username, enabled: enabled),
            c.createTextField(
                title: 'Password',
                controller: password,
                isPassword: true,
                enabled: enabled),
            c.createTextField(
                title: 'Confirm Password',
                controller: confirmPassword,
                isPassword: true,
                enabled: enabled),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: InkWell(
                onTap: enabled
                    ? () {
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
                          setState(() {
                            enabled = false;
                            isLoading = true;
                            Future.delayed(Duration(seconds: 3)).then((value) {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          });
                        }
                      }
                    : null,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
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
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            !enabled
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                            horizontal: 55.0, vertical: 10)
                        .copyWith(bottom: 0),
                    child: Text(
                      'Enter the OTP: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                : SizedBox(),
            !enabled
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: otp,
                        style: TextStyle(fontSize: 18),
                        cursorColor: Colors.black,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        maxLength: 4,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                        ],
                        decoration: InputDecoration(
                          counterText: '',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'OTP',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 18),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            !enabled
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100.0, vertical: 20),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
