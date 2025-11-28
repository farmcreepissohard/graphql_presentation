import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/wish/data/repository/wish_repository_provider.dart';
import 'package:shared/shared.dart';

class ListWishesProvider extends AsyncNotifier<List<Wish>> {
  @override
  FutureOr<List<Wish>> build() {
    return ref.watch(wishRepositoryProvider).getWishes();
  }
}

final listWishesProvider =
    AsyncNotifierProvider<ListWishesProvider, List<Wish>>(
      ListWishesProvider.new,
    );
