import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_phone_number/features/app/const/page_const.dart';
import 'package:flutter_chat_phone_number/features/app/global/widgets/profile_widget.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PageConst.singleChatPage);
        },
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: profileWidget(),
            ),
          ),
          title: Text("Username"),
          subtitle: Text(
            "lasses mess",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            DateFormat.jm().format(DateTime.now()),
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
      );
    }));
  }
}
