import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:frontend/feature/wish/presentation/provider/send_wish_provider.dart';
import 'package:frontend/feature/wish/presentation/widget/wish_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SendCard extends HookConsumerWidget {
  const SendCard({super.key});

  String? validator(String? val) =>
      (val == null || val.trim().isEmpty) ? "This field is required" : null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameWriterController = useTextEditingController();
    final nameReceiverController = useTextEditingController();
    final wishController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());

    ref.listen(sendWishProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Wish sent failed!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.grey,
          ),
        );
      }
      if (!next.isLoading && !next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wish sent successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      nameWriterController.clear();
      nameReceiverController.clear();
      wishController.clear();

      formKey.currentState!.reset();
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: BoxBorder.all(color: const Color(0xffFEACAC), width: 2.0),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Row(
            children: [
              //Icon(Icons.),
              SizedBox(width: 5),
              Text(
                "Send Christmas wish",
                style: TextStyle(color: Color(0xffD32C07), fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: [
                WishTextField(
                  label: "Writer",
                  hintText: "Your name...",
                  isRequired: true,
                  controller: nameWriterController,
                  maxLines: 1,
                  validator: validator,
                ),
                const SizedBox(height: 16),
                WishTextField(
                  label: "Receiver",
                  hintText: "Name receiver (can be empty)...",
                  isRequired: false,
                  controller: nameReceiverController,
                  maxLines: 1,
                ),
                const SizedBox(height: 16),
                WishTextField(
                  label: "Your wish",
                  hintText: "Writer your Christmas wish here...",
                  isRequired: true,
                  controller: wishController,
                  maxLines: 4,
                  validator: validator,
                ),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, child) {
                    final sendWishState = ref.watch(sendWishProvider);
                    return FilledButton(
                      onPressed: sendWishState.isLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                ref
                                    .read(sendWishProvider.notifier)
                                    .submitWish(
                                      writer: nameWriterController.text,
                                      content: wishController.text,
                                      dear: nameReceiverController.text.isEmpty
                                          ? null
                                          : nameReceiverController.text,
                                    );
                              }
                            },
                      style: FilledButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xffEB333B),
                          width: 2.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: child!,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.send_outlined, size: 14, color: Colors.white),
                      SizedBox(width: 20),
                      Text(
                        "Send wish",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
