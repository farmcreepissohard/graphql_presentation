import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/toy/data/repository/remote/toy_hygraph_repository.dart';
import 'package:frontend/feature/toy/data/repository/toy_repository.dart';
import 'package:frontend/feature/toy/data/service/remote/toy_hygraph_service_provider.dart';

final toyHygraphRepositoryProvider = Provider<ToyRepository>(
  (ref) =>
      ToyHygraphRepository(toyService: ref.watch(toyHygraphServiceProvider)),
);
