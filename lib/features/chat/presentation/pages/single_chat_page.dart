import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:intl/intl.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _textMessageController = TextEditingController();
  bool _isDisplaySendButton = false;
  bool _isShowActtachWindow = false;
  @override
  void dispose() {
    _textMessageController.dispose();
    super.dispose();
  }

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
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isShowActtachWindow = false;
          });
        },
        child: Stack(
          children: [
            Positioned(
                child: Image.asset(
                  "assets/brand.png",
                  fit: BoxFit.cover,
                ),
                left: 0,
                right: 0,
                bottom: 0,
                top: 0),
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      // Text("Alo",
                      //     style: TextStyle(fontSize: 25, color: Colors.black)),
                      _messsageLayout(
                          message: "Hello",
                          alignment: Alignment.centerRight,
                          createAt: Timestamp.now(),
                          isSeen: false,
                          isShowTick: true,
                          messsageBgColor: Color.fromARGB(255, 42, 84, 200),
                          onLongPress: () {},
                          onSwipe: (details) {}),
                      _messsageLayout(
                          message: "HOW ARE YOU? ",
                          alignment: Alignment.centerLeft,
                          createAt: Timestamp.now(),
                          isSeen: false,
                          isShowTick: true,
                          messsageBgColor: Color.fromARGB(255, 135, 135, 137),
                          onLongPress: () {},
                          onSwipe: (details) {}),
                      _messsageLayout(
                          message: "Lorem Ipsum is simply dummy te",
                          alignment: Alignment.centerRight,
                          createAt: Timestamp.now(),
                          isSeen: false,
                          isShowTick: true,
                          messsageBgColor: Color.fromARGB(255, 42, 84, 200),
                          onLongPress: () {},
                          onSwipe: (details) {}),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 253, 251, 251),
                              borderRadius: BorderRadius.circular(15)),
                          height: 50,
                          child: TextField(
                            controller: _textMessageController,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  _isDisplaySendButton = true;
                                });
                              } else {
                                setState(() {
                                  _isDisplaySendButton = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                prefixIcon: Icon(
                                  Icons.emoji_emotions,
                                  color: Colors.grey,
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Wrap(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isShowActtachWindow =
                                                !_isShowActtachWindow;
                                          });
                                        },
                                        child: Icon(Icons.attach_file),
                                      ),

                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(Icons.camera_alt),
                                      // Icon(Icons.attach_file),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                ),
                                hintText: 'Message',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Icon(
                            _isDisplaySendButton
                                ? Icons.send_outlined
                                : Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _isShowActtachWindow == true
                ? Positioned(
                    bottom: 65,
                    top: 450,
                    right: 15,
                    left: 15,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.2,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 23, 56, 57),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _acttachWindowItem(
                                icon: Icons.document_scanner,
                                color: Colors.deepPurpleAccent,
                                title: "Documents",
                              ),
                              _acttachWindowItem(
                                icon: Icons.camera_alt,
                                color: Colors.pinkAccent,
                                title: "camera",
                              ),
                              _acttachWindowItem(
                                icon: Icons.image,
                                color: Colors.green,
                                title: "photo",
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _acttachWindowItem(
                                icon: Icons.bar_chart,
                                color: Colors.deepOrangeAccent,
                                title: "Audio",
                              ),
                              _acttachWindowItem(
                                icon: Icons.location_on,
                                color: Colors.greenAccent,
                                title: "Location",
                              ),
                              _acttachWindowItem(
                                icon: Icons.account_circle,
                                color: Colors.deepPurpleAccent,
                                title: "Contact",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
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
                            margin: EdgeInsets.only(top: 10, right: 20),
                            padding: EdgeInsets.only(
                                left: 5, right: 50, top: 5, bottom: 5),
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
                        right: 20,
                        child: Row(
                          children: [
                            Text(DateFormat.jm().format(createAt!.toDate()),
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey)),
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

  _acttachWindowItem(
      {IconData? icon, Color? color, String? title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: color),
            child: Icon(icon),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "$title",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          )
        ],
      ),
    );
  }
}
