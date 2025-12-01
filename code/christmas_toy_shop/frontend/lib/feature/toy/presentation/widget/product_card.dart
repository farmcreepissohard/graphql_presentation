import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

class ProductCard extends ConsumerWidget {
  final Toy toy;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.toy, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(color: const Color(0xffFFE2E2), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  toy.imageUrl,
                  fit: BoxFit.cover,
                  cacheWidth: 300,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    toy.name,
                    style: const TextStyle(
                      color: Color(0xff8D181A),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${toy.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffC1002F),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${toy.quantity}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
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
