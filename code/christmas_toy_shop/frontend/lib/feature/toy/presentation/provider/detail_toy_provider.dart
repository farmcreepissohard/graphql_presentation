import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/toy/data/repository/toy_repository_provider.dart';
import 'package:shared/shared.dart';

class DetailToyProvider extends AsyncNotifier<Toy> {
  final String toyId;

  DetailToyProvider(this.toyId);

  @override
  FutureOr<Toy> build() {
    return ref.watch(toyRepositoryProvider).getToyDetail(toyId);
  }
}

final detailToyProvider =
    AsyncNotifierProvider.family<DetailToyProvider, Toy, String>(
      DetailToyProvider.new,
    );
