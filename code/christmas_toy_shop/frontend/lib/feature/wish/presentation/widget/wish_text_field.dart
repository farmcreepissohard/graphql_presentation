import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WishTextField extends ConsumerWidget {
  final String label;
  final String hintText;
  final bool isRequired;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;

  const WishTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isRequired,
    required this.controller,
    required this.maxLines,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              color: Color(0xffC1002F),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            children: [
              isRequired
                  ? const TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: Color(0xffE7000B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const TextSpan(
                      text: " (Optional)",
                      style: TextStyle(
                        color: Color(0xffC1002F),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(height: 4.0),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFEACAC), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFEACAC), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFEACAC), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            contentPadding: EdgeInsets.all(8),
            isDense: true,
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
