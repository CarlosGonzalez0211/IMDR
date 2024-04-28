import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathon_app/screens/chatapp/constants/chat_app_constants.dart';

class LepiaChatScreen extends StatefulWidget {

  final User? userData;

  const LepiaChatScreen({super.key, required this.userData});

  @override
  State<LepiaChatScreen> createState() => _LepiaChatScreenState();
}

class _LepiaChatScreenState extends State<LepiaChatScreen> {
  final Gemini _gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  late final ChatUser currentUser = ChatUser(
      id: '0',
      firstName: widget.userData?.displayName ?? "User",
      profileImage: widget.userData?.photoURL ?? ChatScreenConstants.defaultUserURL
  );
  late final ChatUser aIUser = ChatUser(id: '1', firstName: "LepiaGPT", profileImage: ChatScreenConstants.GEMINI_PROFILE_PIC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask Lepia"),
        actions: [
          CircleAvatar(
            radius: 34,
            backgroundImage: NetworkImage(
              widget.userData?.photoURL ?? ChatScreenConstants.defaultUserURL

            ),
          )
        ],
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(
        trailing: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {}, // Define your button functionality here
                icon: const Icon(FontAwesomeIcons.fileMedicalAlt, color: Colors.blue,), // Main icon
                iconSize: 30, // You can adjust the size as needed
              ),
              const Positioned(
                bottom: 0, // Position from the bottom of the stack
                right: 0, // Position from the right of the stack
                child: Icon(
                  FontAwesomeIcons.question, // Decorative icon
                  size: 20, // Smaller size as it's decorative
                  color: Colors.black, // Optional: change color if needed
                ),
              ),
            ],
          )
        ]
      ),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;
      _gemini.streamGenerateContent(question).listen((event) { 
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == aIUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold("", (previous, current) => "$previous ${current.text}") ?? "";
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ... messages];
          });
        }else {
          String response = event.content?.parts?.fold("", (previous, current) => "$previous ${current.text}") ?? "";
          ChatMessage message = ChatMessage(user: aIUser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    }
    catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    // todo retrieve from database
  }
}
