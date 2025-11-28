import 'package:frontend/feature/toy/presentation/screen/toy_detail_screen.dart';
import 'package:frontend/feature/toy/presentation/screen/toy_screen.dart';
import 'package:frontend/feature/wish/presentation/screen/wish_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "toys",
        builder: (context, state) => const ToyScreen(),
        routes: [
          GoRoute(
            path: "toy/:id",
            name: "toyDetail",
            builder: (context, state) {
              final String toyId = state.pathParameters['id']!;
              return ToyDetailScreen(toyId: toyId);
            },
          ),
        ],
      ),
      GoRoute(
        path: "/wishes",
        name: "wishes",
        builder: (context, state) => const WishScreen(),
      ),
    ],
  ),
);
