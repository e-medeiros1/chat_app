import 'dart:convert';

import 'package:chat_app/app/models/chat_message_entity.dart';
import 'package:chat_app/app/services/auth_service.dart';
import 'package:chat_app/app/widgets/custom_chat_bubble.dart';
import 'package:chat_app/app/widgets/custom_gridview_giphy.dart';
import 'package:chat_app/app/widgets/custom_gridview_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/routes.dart';

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
  sendMessage() async {
    String? cachedUsername = context.read<AuthService>().getUsername();
    final newMessage = ChatMessageEntity(
      text: chatEC.text,
      id: '123',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(username: cachedUsername!),
    );

    if (_selectedImageUrl.isNotEmpty) {
      newMessage.imageUrl = _selectedImageUrl;
    }

    _messages.add(newMessage);

    chatEC.clear();
    _selectedImageUrl = '';

    setState(() {});
  }

//Pick images or gifs
  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthService>().getUsername();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.login),
                              title: const Text('Logout'),
                              onTap: () {
                                context.read<AuthService>().userLogout();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  NamedRoutes.LOGIN_PAGE,
                                  (route) => false,
                                );
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.info_outline))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return CustomChatBubble(
                      align: _messages[index].author.username ==
                              context.read<AuthService>().getUsername()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index],
                    );
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
                            return DefaultTabController(
                              length: 2,
                              initialIndex: 0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const TabBar(
                                    labelColor: Colors.black87,
                                    indicatorColor: Colors.black54,
                                    tabs: [
                                      Tab(
                                        icon: Icon(Icons.photo),
                                      ),
                                      Tab(
                                        icon: Icon(Icons.gif),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        CustomGridviewImages(
                                            onImageSelected: onImagePicked),
                                        CustomGridviewGiphy(
                                            onImageSelected: onImagePicked),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
