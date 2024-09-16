import 'dart:convert';
import 'dart:developer';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:examace/features/Bookmark/ui/bookmark.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ChatUser sidessh = ChatUser(id: '1', firstName: 'Sidessh');
  ChatUser examAce =
      ChatUser(id: '2', firstName: 'ExamAce', profileImage: 'assets/icon.png');

  List<ChatMessage> messageList = [];
  List<ChatUser> typingAnimation = [];

  final myURL = 'http://127.0.0.1:5000';

  final header = {'Content-Type': 'application/json'};

  void hitApi(ChatMessage m) async {
    m = ChatMessage(
      text: '${m.text}',
      user: m.user,
      createdAt: m.createdAt,
    );
    typingAnimation.add(examAce);
    messageList.insert(0, m);
    setState(() {});
    var client = http.Client();
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'question': '${m.text}. Explain in detail'};
    String jsonBody = json.encode(body);
    try {
      var response = await client.post(Uri.parse('http://127.0.0.1:5000'),
          headers: headers, body: jsonBody);
      var decodeResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        ChatMessage responseMessage = ChatMessage(
            text: decodeResponse['answer'],
            user: examAce,
            createdAt: DateTime.now());
        messageList.insert(0, responseMessage);
      } else {
        ChatMessage responseMessage = ChatMessage(
            text: 'Unable to generate the answer.Please try again later',
            user: examAce,
            createdAt: DateTime.now());
        messageList.insert(0, responseMessage);
      }
    } catch (e) {
      ChatMessage responseMessage = ChatMessage(
          text: 'Server is busy.Please try again later',
          user: examAce,
          createdAt: DateTime.now());
      messageList.insert(0, responseMessage);
    }
    typingAnimation.remove(examAce);
    setState(() {});
  }

  // getData(ChatMessage m) async {
  //   m = ChatMessage(
  //     text: '${m.text} Explain in detail',
  //     user: m.user,
  //     createdAt: m.createdAt,
  //   );

  //   typingAnimation.add(examAce);
  //   messageList.insert(0, m);
  //   setState(() {});

  // Map<String, dynamic> body = {'question':m.text};

  //   await http
  //       .post(Uri.parse(myURL), headers: header, body: json.encode(body))
  //       .then((value) {
  //     print(value.body);
  //     if (value.statusCode == 200) {
  //       var resultResponse = jsonDecode(value.body);
  //       print(resultResponse);

  //       ChatMessage responseMessage = ChatMessage(
  //           text: resultResponse['candidates'][0]['content']['parts'][0]
  //               ['text'],
  //           user: examAce,
  //           createdAt: DateTime.now());

  //       messageList.insert(0, responseMessage);
  //     } else {
  //       print('Error');
  //     }
  //   }).catchError((e) {});

  //   typingAnimation.remove(examAce);
  //   setState(() {});
  // }

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
                    'Computer Network',
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
                        messageTextBuilder: (
                          ChatMessage message,
                          ChatMessage? previousMessage,
                          ChatMessage? nextMessage,
                        ) {
                          return message.user.id == '1'
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFEBA04),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MarkdownBody(
                                    data: message.text,
                                    styleSheet: MarkdownStyleSheet(
                                      p: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      strong: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF262626),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MarkdownBody(
                                    data: message.text,
                                    styleSheet: MarkdownStyleSheet(
                                      p: const TextStyle(color: Colors.white),
                                      strong: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                        },
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
                                            FlutterClipboard.copy(message.text)
                                                .then((value) => ScaffoldMessenger
                                                        .of(context)
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
                                          onPressed: () {
                                            setState(() {
                                              // Add the message to the global list
                                              if (!bookmarkedMessages
                                                  .contains(message)) {
                                                bookmarkedMessages.add(message);
                                              }
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content:
                                                        Text("Bookmarked!")));
                                          },
                                          icon: Icon(
                                            Icons.bookmark_add_outlined,
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
                                : Container(),
                      ),
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
                        hitApi(m);
                      },
                      messages: messageList,
                    ),
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

List<ChatMessage> bookmarkedMessages = [];
