import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_phone_number/features/app/global/widgets/profile_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setting")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: profileWidget(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User name",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text("live",
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                      const SizedBox(
                        width: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          _settingsItemWidget(
              title: "Logout",
              description: "Logout",
              icon: Icons.logout,
              onTap: () {}),
        ],
      ),
    );
  }

  Widget _settingsItemWidget(
      {String? title,
      String? description,
      IconData? icon,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
              width: 80,
              height: 80,
              child: Icon(icon, color: Colors.grey, size: 25)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              const SizedBox(
                width: 2,
              ),
              Text("$description",
                  style: TextStyle(fontSize: 13, color: Colors.black))
            ],
          ))
        ],
      ),
    );
  }
}
