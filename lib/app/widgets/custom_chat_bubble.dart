// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/chat_message_entity.dart';

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
    return Align(
      alignment: align,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .5,
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                entity.text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            if (entity.imageUrl != null)
              Image.asset(
                entity.imageUrl!,
                height: 200,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
