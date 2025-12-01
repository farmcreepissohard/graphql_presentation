import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/toy/data/repository/local/toy_local_repository_provider.dart';
import 'package:frontend/feature/toy/data/repository/remote/toy_hygraph_repository_provider.dart';
import 'package:frontend/feature/toy/data/repository/toy_repository.dart';

final toyRepositoryProvider = Provider<ToyRepository>(
  (ref) => ref.watch(toyLocalRepositoryProvider),
);
