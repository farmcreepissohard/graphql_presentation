import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/toy/data/repository/local/toy_local_repository.dart';
import 'package:frontend/feature/toy/data/repository/toy_repository.dart';
import 'package:frontend/feature/toy/data/service/local/toy_local_service_provider.dart';

final toyLocalRepositoryProvider = Provider<ToyRepository>(
  (ref) => ToyLocalRepository(toyService: ref.watch(toyLocalServiceProvider)),
);
