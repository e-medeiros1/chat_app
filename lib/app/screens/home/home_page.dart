import 'package:chat_app/app/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final chatEC = TextEditingController();

  sendMessage() {
    print('Message: ${chatEC.text}');
    cleanField();
  }

  cleanField() {
    chatEC.text = '';
  }

  @override
  void dispose() {
    chatEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black54),
            titleTextStyle: const TextStyle(
              color: Colors.black87,
              letterSpacing: -0.5,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            title: const Text(
              'Hi, Username!',
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.output_outlined),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CustomChatBubble(
                        align: index % 2 == 0
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        message: 'This is my first message!');
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60,
              width: double.infinity,
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    controller: chatEC,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    cursorColor: Colors.white,
                    textCapitalization: TextCapitalization.sentences,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 19, letterSpacing: -.5),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
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
          ),
        ),
      ),
    );
  }
}
