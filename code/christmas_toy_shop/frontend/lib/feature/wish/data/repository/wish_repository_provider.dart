import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/feature/wish/data/repository/local/wish_local_repository_provider.dart';
import 'package:frontend/feature/wish/data/repository/remote/wish_hygraph_repository_provider.dart';
import 'package:frontend/feature/wish/data/repository/wish_repository.dart';

final wishRepositoryProvider = Provider<WishRepository>(
  (ref) => ref.watch(wishLocalRepositoryProvider),
);