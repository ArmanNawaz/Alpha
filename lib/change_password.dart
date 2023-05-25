import 'package:alpha/constants.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Constants c = Constants();
  TextEditingController currPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController cfmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: ListView(
        // shrinkWrap: true,
        children: [
          SizedBox(
            height: 50,
          ),
          textField(title: 'Current Password', controller: currPass),
          textField(title: 'New Password', controller: newPass),
          textField(title: 'Confirm Password', controller: cfmPass),
          SizedBox(
            height: 80,
          ),
          Center(
            child: InkWell(
              onTap: () {
                // TODO: change password
              },
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF3739A6), Color(0xFF8B4FE3)]),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Update Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget textField(
    {required String title, required TextEditingController controller}) {
  bool hide = true;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      // decoration: BoxDecoration(
      //     color: Colors.white.withOpacity(0.5),
      //     borderRadius: BorderRadius.circular(20)),
      child: StatefulBuilder(builder: (ctx, setState) {
        return TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          obscureText: hide,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            // border: OutlineInputBorder(borderSide: BorderSide()),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 2),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            labelText: title,
            labelStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            suffixIcon: IconButton(
                iconSize: 22,
                onPressed: () {
                  setState(() {
                    hide = !hide;
                  });
                },
                icon: Icon(hide
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined)),
            hintText: title,
            hintStyle: TextStyle(fontSize: 18),
          ),
        );
      }),
    ),
  );
}
