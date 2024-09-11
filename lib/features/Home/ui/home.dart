import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ChatUser sidessh = ChatUser(id: '1', firstName: 'Sidessh');
  ChatUser aquaBot =
      ChatUser(id: '2', firstName: 'ExamAce', profileImage: 'assets/icon.png');

  List<ChatMessage> messageList = [];
  List<ChatUser> typingAnimation = [];

  final myURL =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${dotenv.env["GEMINI_API"]}';

  final header = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typingAnimation.add(aquaBot);
    messageList.insert(0, m);
    setState(() {});

    var textData = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(myURL), headers: header, body: jsonEncode(textData))
        .then((value) {
      print(value.body);
      if (value.statusCode == 200) {
        var resultResponse = jsonDecode(value.body);
        print(resultResponse['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage responseMessage = ChatMessage(
            text: resultResponse['candidates'][0]['content']['parts'][0]
                ['text'],
            user: aquaBot,
            createdAt: DateTime.now());

        messageList.insert(0, responseMessage);
      } else {
        print('Error');
      }
    }).catchError((e) {});

    typingAnimation.remove(aquaBot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image(
                      image: AssetImage('assets/icon.png'),
                    ),
                  ),
                  Text(
                    'Subject Name',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: DashChat(
                        messageOptions: MessageOptions(
                            currentUserContainerColor: const Color(0xffFEBA04),
                            currentUserTextColor: Colors.black,
                            containerColor: const Color(0xFF262626),
                            textColor: Colors.white,
                            bottom: (message, previousMessage, nextMessage) =>
                                message.user.id != '1'
                                    ? Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                FlutterClipboard.copy(
                                                        message.text)
                                                    .then((value) =>
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Copied!!"))));
                                              },
                                              icon: Icon(
                                                Icons.copy,
                                                size: screenWidth * (20 / 432),
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.thumb_up_off_alt_sharp,
                                                size: screenWidth * (20 / 432),
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.thumb_down_off_alt_sharp,
                                                size: screenWidth * (20 / 432),
                                              ))
                                        ],
                                      )
                                    : Container()),
                        scrollToBottomOptions:
                            const ScrollToBottomOptions(disabled: true),
                        inputOptions: InputOptions(
                          inputTextStyle: const TextStyle(color: Colors.white),
                          inputDecoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFEBA04)))),
                          sendButtonBuilder: (onSend) {
                            return IconButton(
                              icon: const Icon(
                                Icons.send,
                                color: Colors.yellow,
                              ),
                              onPressed: () {
                                if (onSend != null) {
                                  onSend();
                                }
                              },
                            );
                          },
                        ),
                        typingUsers: typingAnimation,
                        currentUser: sidessh,
                        onSend: (ChatMessage m) {
                          getData(m);
                        },
                        messages: messageList),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
