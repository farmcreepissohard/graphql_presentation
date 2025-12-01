import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/wish/data/repository/remote/wish_hygraph_repository.dart';
import 'package:frontend/feature/wish/data/repository/wish_repository.dart';
import 'package:frontend/feature/wish/data/service/remote/wish_hygraph_service_provider.dart';

final wishHygraphRepositoryProvider = Provider<WishRepository>(
  (ref) =>
      WishHygraphRepository(wishService: ref.watch(wishHygraphServiceProvider)),
);
