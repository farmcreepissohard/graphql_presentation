import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/toy/data/repository/toy_repository_provider.dart';
import 'package:shared/shared.dart';

class ListToysProvider extends AsyncNotifier<List<Toy>> {
  @override
  FutureOr<List<Toy>> build() {
    return ref.watch(toyRepositoryProvider).getToys();
  }
}

final listToysProvider = AsyncNotifierProvider<ListToysProvider, List<Toy>>(
  ListToysProvider.new,
);
