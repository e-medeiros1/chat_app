import 'dart:convert';

import 'package:chat_app/app/models/chat_message_entity.dart';
import 'package:chat_app/app/services/auth_service.dart';
import 'package:chat_app/app/utils/routes.dart';
import 'package:chat_app/app/widgets/custom_chat_bubble.dart';
import 'package:chat_app/app/widgets/custom_gridview_giphy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatEC = TextEditingController();
  List<ChatMessageEntity> _messages = [];
  String _selectedImageUrl = '';

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  void dispose() {
    chatEC.dispose();
    super.dispose();
  }

//Loading mocked messages
  _loadInitialMessages() async {
    final response =
        await rootBundle.loadString('assets/chat_messages_mock.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<ChatMessageEntity> chatMessages = decodedList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    setState(() {
      _messages = chatMessages;
    });
  }

//Send messages
  sendMessage() {
    final newMessage = ChatMessageEntity(
      text: chatEC.text,
      id: '123',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(username: context.read<AuthService>().getUsername()),
    );

    if (_selectedImageUrl.isNotEmpty) {
      newMessage.imageUrl = _selectedImageUrl;
    }

    _messages.add(newMessage);

    chatEC.clear();
    _selectedImageUrl = '';

    setState(() {});
  }

//Pick images
  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleTextStyle: const TextStyle(
              color: Colors.black87,
              letterSpacing: -0.5,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            title: Text(
              'Hi, $username!',
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(NamedRoutes.LOGIN_PAGE);
                },
                icon: const Icon(Icons.output_outlined),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return CustomChatBubble(
                        align: _messages[index].author.username == context.read<AuthService>().getUsername()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        entity: _messages[index]);
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return CustomGridviewGiphy(
                              onImageSelected: onImagePicked,
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        _selectedImageUrl.isEmpty
                            ? const SizedBox.shrink()
                            : Image.network(_selectedImageUrl),
                        TextField(
                          controller: chatEC,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          cursorColor: Colors.white,
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              letterSpacing: -.5),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type your message...',
                              hintStyle: TextStyle(
                                color: Colors.blueGrey,
                              )),
                        ),
                      ],
                    )),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: sendMessage,
                      icon: const Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
