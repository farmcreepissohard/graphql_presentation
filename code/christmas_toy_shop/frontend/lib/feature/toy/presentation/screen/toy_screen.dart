import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/toy/presentation/provider/list_toys_provider.dart';
import 'package:frontend/feature/toy/presentation/widget/product_card.dart';
import 'package:go_router/go_router.dart';

class ToyScreen extends ConsumerWidget {
  const ToyScreen({super.key});

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
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffFFE2E2),
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
            onPressed: () {
              context.pushReplacementNamed("wishes");
            },
            style: OutlinedButton.styleFrom(
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(
              builder: (context, ref, child) {
                final listToys = ref.watch(listToysProvider);
                return listToys.when(
                  data: (data) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 2 / 3,
                        ),
                    itemBuilder: (context, index) => ProductCard(
                      toy: data[index],
                      onTap: () {
                        context.pushNamed(
                          "toyDetail",
                          pathParameters: {"id": data[index].id},
                        );
                        //context.push('/toy/${data[index].id}');
                      },
                    ),
                    itemCount: data.length,
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
