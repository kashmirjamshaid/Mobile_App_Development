import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54),
          title: const Text(
            'WhatsApp',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            const Icon(Icons.search),
            const SizedBox(width: 15),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => const [
                PopupMenuItem(value: '1', child: Text('New group')),
                PopupMenuItem(value: '2', child: Text('Settings')),
                PopupMenuItem(value: '3', child: Text('Logout')),
              ],
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            // CAMERA
            const Center(child: Icon(Icons.camera_alt, size: 80)),

            // CHATS
            ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/35887018/pexels-photo-35887018.jpeg",
                    ),
                  ),
                  title: Text(
                    'Arena',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Hey! how are you?'),
                  trailing: const Text(
                    '6:45 PM',
                    style: TextStyle(fontSize: 12),
                  ),
                );
              },
            ),

            // STATUS
            ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  title: Text('My Status'),
                  subtitle: Text('Tap to add status update'),
                ),
                Divider(),
                ListTile(
                  title: Text('Recent updates'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/35887018/pexels-photo-35887018.jpeg",
                    ),
                  ),
                  title: Text('Arena'),
                  subtitle: Text('10 minutes ago'),
                ),
              ],
            ),

            // CALLS
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/35887018/pexels-photo-35887018.jpeg",
                    ),
                  ),
                  title: Text('Arena'),
                  subtitle: Text(
                    index % 2 == 0 ? 'Missed call' : 'Incoming call',
                  ),
                  trailing: Icon(
                    index % 2 == 0 ? Icons.call_missed : Icons.call,
                    color: Colors.green,
                  ),
                );
              },
            ),
          ],
        ),

        //  WhatsApp Floating Action Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          child: const Icon(Icons.chat),
          onPressed: () {},
        ),
      ),
    );
  }
}