import 'package:frontend/feature/wish/data/repository/wish_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishes_count_provider.g.dart';

@riverpod
class WishesCount extends _$WishesCount {
  @override
  Future<int> build() async {
    return ref.watch(wishRepositoryProvider).getCountWishes();
  }
}
