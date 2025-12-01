import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

class WishCard extends ConsumerWidget {
  final Wish wish;

  const WishCard({super.key, required this.wish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: BoxBorder.all(color: Colors.white, width: 5.0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sender",
                        style: TextStyle(
                          color: Color(0xffF8B3B6),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        wish.writer,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (wish.dear != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.gift_fill,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Receiver",
                          style: TextStyle(
                            color: Color(0xffF8B3B6),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          wish.dear!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            const Divider(thickness: 2.0, color: Color(0xffEE4D54), height: 40),
            Text(
              "\"${wish.content}\"",
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Divider(thickness: 1.0, color: Color(0xffEE4D54), height: 40),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${wish.createdDate.day.toString().padLeft(2, '0')}/${wish.createdDate.month.toString().padLeft(2, '0')}/${wish.createdDate.year}",
                style: const TextStyle(color: Color(0xffF8B3B6), fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
