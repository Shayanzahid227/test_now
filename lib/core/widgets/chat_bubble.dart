
import 'package:flutter/material.dart';
import 'package:test_now/core/constant/app_assets.dart';
import 'package:test_now/core/constant/colors.dart';
import 'package:test_now/core/constant/text_style.dart';
import 'package:test_now/core/models/message.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final VoidCallback onTap;
  const ChatBubble({super.key, required this.message, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: message.isMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            // ✅ Show avatar only if it's not my message
            if (!message.isMe) ...[
              GestureDetector(
                onTap: onTap,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(AppAssets().h),
                ),
              ),
            ],

            Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              padding: const EdgeInsets.all(12),
              constraints: const BoxConstraints(maxWidth: 280),
              decoration: BoxDecoration(
                color: message.isMe ? primaryColor : Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: message.isMe
                      ? const Radius.circular(16.0)
                      : const Radius.circular(0),
                  topRight: message.isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(16),
                  bottomLeft: message.isMe
                      ? const Radius.circular(16)
                      : const Radius.circular(16),
                  bottomRight: message.isMe
                      ? const Radius.circular(16)
                      : const Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: message.isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (!message.isMe)
                    Text(
                      message.sender,
                      style: style12.copyWith(
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  Text(
                    message.text,
                    style: style14.copyWith(
                      color: message.isMe ? whiteColor : blackColor,
                    ),
                  ),
                  Text(
                    message.time,
                    style: style12.copyWith(
                      color: message.isMe
                          ? whiteColor.withOpacity(0.7)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
