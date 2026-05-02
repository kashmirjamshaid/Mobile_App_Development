import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isFollowed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              margin: EdgeInsets.all(20.0),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/image.jpeg"),
                  backgroundColor: Colors.grey,
                ),
              ),
            ),

            Text('Kashmir', style: TextStyle(fontSize: 30)),
            SizedBox(height: 8),
            Text('Flutter Developer', style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.blue[100],
                    child: Center(
                      child: Text(
                        "About Me",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 8),

                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.green[100],
                    child: Center(
                      child: Text(
                        "Links",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

        
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.amber, size: 40),
                title: Text(
                  "Score",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  "$score points",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFollowed = !isFollowed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFollowed ? Colors.grey : Colors.blue,
                  ),
                  child: Text(
                    isFollowed ? "Unfollow" : "Follow",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(width: 16),

                IconButton(
                  onPressed: () {
                    setState(() {
                      score++;
                    });
                  },
                  icon: Icon(Icons.thumb_up, color: Colors.blue),
                  iconSize: 32,
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}