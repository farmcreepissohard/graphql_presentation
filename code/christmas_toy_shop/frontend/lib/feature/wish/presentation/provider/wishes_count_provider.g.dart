// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishes_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WishesCount)
const wishesCountProvider = WishesCountProvider._();

final class WishesCountProvider
    extends $AsyncNotifierProvider<WishesCount, int> {
  const WishesCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishesCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishesCountHash();

  @$internal
  @override
  WishesCount create() => WishesCount();
}

String _$wishesCountHash() => r'736fffd2ffabbd202750e2925e84bcc12280ff3c';

abstract class _$WishesCount extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
