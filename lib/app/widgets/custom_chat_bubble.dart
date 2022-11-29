// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/chat_message_entity.dart';
import '../services/auth_service.dart';

class CustomChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final AlignmentGeometry align;

  const CustomChatBubble({
    Key? key,
    required this.align,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAuthor =
        entity.author.username == context.read<AuthService>().getUsername();
    return Align(
      alignment: align,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .6,
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isAuthor ? Colors.deepPurple : Colors.black87,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            if (entity.imageUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(entity.imageUrl!)),
                    borderRadius: BorderRadius.circular(12)),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                entity.text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
