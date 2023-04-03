import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 260,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                      image: AssetImage('assets/img bk.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      'assets/profile.png',
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'JUGAL SINGH',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 230,
              child: Material(
                elevation: 50,
                shadowColor: Colors.blue,
                // borderRadius: BorderRadius.circular(20),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFB176CC)),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                    height: size.height * 0.6,
                    width: size.width * 0.8,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            child: Container(
                              height: 50,
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          );
                        })),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xFF0D5DD7),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Change Profile Pic',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
