import 'package:flutter/material.dart';
import 'package:flutter_chat_phone_number/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter_chat_phone_number/features/chat/presentation/pages/contact_page.dart';
import 'package:flutter_chat_phone_number/features/user/app/const/page_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _curentTabIndex = 0;
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController!.addListener(() {
      setState(() {
        _curentTabIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat App",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.camera, color: Colors.white, size: 28),
              SizedBox(
                width: 25,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 28,
                ),
                color: Colors.white,
                iconSize: 28,
                onSelected: (value) {},
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "Settings",
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageConst.settingsPage);
                      },
                      child: const Text("Setting"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                "Chat",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "Status",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "Call",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: switchOnTabIndex(_curentTabIndex),
      body: TabBarView(
        controller: _tabController,
        children: const [ChatPage()],//sswitch screeen tab
      ),
    );
  }

  switchOnTabIndex(int index) {
    switch (index) {
      case 0:
        {
          return FloatingActionButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => ContactPage(),
              //   ),
              // );
              Navigator.pushNamed(context, PageConst.contacUsersPage);
            },
            backgroundColor: Colors.blue,
            child: Icon(Icons.message, color: Colors.white),
          );
        }
      case 1:
        {
          return FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            child: Icon(Icons.camera_alt, color: Colors.white),
          );
        }
      case 2:
        {
          return FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            child: Icon(Icons.add_call, color: Colors.white),
          );
        }
      default:
        {
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            child: Icon(Icons.message, color: Colors.white),
          );
        }
    }
  }
}
