import 'package:frontend/feature/wish/data/repository/wish_repository_provider.dart';
import 'package:frontend/feature/wish/presentation/provider/list_wishes_provider.dart';
import 'package:frontend/feature/wish/presentation/provider/wishes_count_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_wish_provider.g.dart';

@riverpod
class SendWish extends _$SendWish {
  @override
  FutureOr<void> build() {}

  Future<void> submitWish({
    required String writer,
    String? dear,
    required String content,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final wishRepo = ref.read(wishRepositoryProvider);
      await wishRepo.sendWish(writer: writer, dear: dear, content: content);

      _refreshProviderView();
    });
  }

  void _refreshProviderView() {
    ref.invalidate(listWishesProvider);
    ref.invalidate(wishesCountProvider);
  }
}
