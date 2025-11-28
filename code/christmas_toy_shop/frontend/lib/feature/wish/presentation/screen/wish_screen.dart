import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/wish/presentation/provider/list_wishes_provider.dart';
import 'package:frontend/feature/wish/presentation/provider/wishes_count_provider.dart';
import 'package:frontend/feature/wish/presentation/widget/send_card.dart';
import 'package:frontend/feature/wish/presentation/widget/wish_card.dart';
import 'package:go_router/go_router.dart';

class WishScreen extends ConsumerWidget {
  const WishScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
        actions: [
          IconButton(
            onPressed: () {
              context.pushReplacementNamed("toys");
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(4.0),
              ),
            ),
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 16,
              color: Color(0xffE7000B),
            ),
          ),
          IconButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffFFE2E2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(4.0),
              ),
            ),
            icon: const Icon(
              Icons.star_border_rounded,
              size: 16,
              color: Color(0xffE7000B),
            ),
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Color(0xffE7000B)),
                    Text(
                      "Christmas Wish",
                      style: TextStyle(color: Color(0xffD32C07), fontSize: 16),
                    ),
                    Icon(Icons.star, color: Color(0xffE7000B)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Send your Christmas wishes and see the blessings from people all over. May this holiday season be filled with love and hope!",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const SendCard(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color(0xffFFA2A2),
                          endIndent: 16.0,
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          final wishesCount = ref.watch(wishesCountProvider);
                          return wishesCount.when(
                            data: (data) => Text(
                              "All wishes ($data)",
                              style: const TextStyle(
                                color: Color(0xffC10007),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            error: (error, stackTrace) => const Text(
                              "All wishes ",
                              style: TextStyle(
                                color: Color(0xffC10007),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            loading: () => const Text(
                              "All wishes ",
                              style: TextStyle(
                                color: Color(0xffC10007),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),
                      const Expanded(
                        child: Divider(color: Color(0xffFFA2A2), indent: 16.0),
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final listWishes = ref.watch(listWishesProvider);
                    return listWishes.when(
                      data: (data) => Column(
                        children: data.map((e) => WishCard(wish: e)).toList(),
                      ),
                      error: (error, stackTrace) => Text("$error"),
                      loading: () => const CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
