import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:intl/intl.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("User name",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Text("online",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 33, 147, 36)))
          ],
        ),
        actions: [
          Icon(
            Icons.videocam_rounded,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.call,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.more_vert,
            size: 25,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Positioned(
          //     child: Image.asset(
          //       "assets/brand.png",
          //       fit: BoxFit.cover,
          //     ),
          //     left: 0,
          //     right: 0,
          //     bottom: 0,
          //     top: 0),
          Column(
            children: [
              ListView(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Text("Alo",
                            style:
                                TextStyle(fontSize: 25, color: Colors.black)),
                        _messsageLayout(
                            message: "Hello",
                            alignment: Alignment.centerRight,
                            createAt: Timestamp.now(),
                            isSeen: false,
                            isShowTick: true,
                            messsageBgColor:
                                const Color.fromARGB(255, 10, 10, 10),
                            onLongPress: () {},
                            onSwipe: (details) {
                              // Handle swipe action here
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _messsageLayout({
    Color? messsageBgColor,
    Alignment? alignment,
    Timestamp? createAt,
    Function(DragUpdateDetails)? onSwipe,
    String? message,
    bool? isShowTick,
    bool? isSeen,
    VoidCallback? onLongPress,
  }) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: SwipeTo(
            onRightSwipe: onSwipe,
            child: GestureDetector(
                onLongPress: onLongPress,
                child: Container(
                  alignment: alignment,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                                color: messsageBgColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "$message",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 4,
                        right: 10,
                        child: Row(
                          children: [
                            Text(DateFormat.jm().format(createAt!.toDate()),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            const SizedBox(
                              height: 5,
                            ),
                            isShowTick == true
                                ? Icon(
                                    isSeen == true
                                        ? Icons.done_all
                                        : Icons.done,
                                    size: 16,
                                    color: isSeen == true
                                        ? Colors.blue
                                        : Colors.grey,
                                  )
                                : Container()
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
