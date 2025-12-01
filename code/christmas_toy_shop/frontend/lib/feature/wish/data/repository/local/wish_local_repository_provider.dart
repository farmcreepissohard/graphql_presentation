import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/wish/data/repository/local/wish_local_repository.dart';
import 'package:frontend/feature/wish/data/repository/wish_repository.dart';
import 'package:frontend/feature/wish/data/service/local/wish_local_service_provider.dart';

final wishLocalRepositoryProvider = Provider<WishRepository>(
  (ref) =>
      WishLocalRepository(wishService: ref.watch(wishLocalServiceProvider)),
);
