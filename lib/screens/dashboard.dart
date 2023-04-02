import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Color(0xFFCDE1FF),
          elevation: 10,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bk3.jpg'), fit: BoxFit.cover),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/profile.png'),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jugal Singh',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'BTech CSE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Notification',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Change Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Go to Website',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Review',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'About Us',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Logout',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bk2.jpg'), fit: BoxFit.cover),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: SizedBox(
                  height: 150,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/profile.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('PROFILE')
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Event.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('EVENT')
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/chat.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('CHATBOX')
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Discuss3.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('DISCUSS')
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/E-resource.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('E-RESOURCE')
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Gallery.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('GALLERY')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
