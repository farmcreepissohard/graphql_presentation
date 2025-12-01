import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/toy/presentation/provider/detail_toy_provider.dart';
import 'package:go_router/go_router.dart';

class ToyDetailScreen extends ConsumerWidget {
  final String toyId;
  const ToyDetailScreen({super.key, required this.toyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xffE7000B),
            size: 35,
          ),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Icon(
                Icons.toys_outlined,
                color: Color(0xffE7000B),
                size: 35,
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Christmas toy shop",
                  style: TextStyle(fontSize: 16, color: Color(0xffE7000B)),
                ),
                Text(
                  "Cozy in winter",
                  style: TextStyle(fontSize: 16, color: Color(0xff00A63E)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(
              builder: (context, ref, child) {
                final toy = ref.watch(detailToyProvider(toyId));
                return toy.when(
                  data: (data) => ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: BoxBorder.all(
                            color: const Color(0xffFEACAC),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8.0),
                          child: Image.network(
                            data.imageUrl,
                            cacheWidth: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        data.name,
                        style: const TextStyle(
                          color: Color(0xff8D181A),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$${data.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffC1002F),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${data.quantity} products left",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Divider(color: Color(0xffFEACAC)),
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                          color: Color(0xff8D181A),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Divider(color: Color(0xffFEACAC)),
                      ),
                      const Text(
                        "Quantity",
                        style: TextStyle(
                          color: Color(0xff8D181A),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  error: (error, stackTrace) => Text("$error"),
                  loading: () => const CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
