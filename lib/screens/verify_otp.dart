import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  TextEditingController otp = TextEditingController();
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
                  'OTP',
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
                  controller: otp,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  maxLength: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'OTP',
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 24),
                      counter: null,
                      counterText: ""),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context, CupertinoPageRoute(builder: (_) => SignUp()));
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
                    'Verify',
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
