import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
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

  final header = {'Content-Type': 'application/json'};

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return const Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
