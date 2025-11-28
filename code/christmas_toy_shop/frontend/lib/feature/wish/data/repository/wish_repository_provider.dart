import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/wish/data/repository/wish_repository.dart';
import 'package:frontend/feature/wish/data/service/remote/wish_hygraph_service_provider.dart';

final wishRepositoryProvider = Provider<WishRepository>(
  (ref) => WishRepository(wishApi: ref.watch(wishHygraphServiceProvider)),
);
