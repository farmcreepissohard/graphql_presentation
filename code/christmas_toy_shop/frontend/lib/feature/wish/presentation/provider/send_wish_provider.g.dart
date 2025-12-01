// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_wish_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendWish)
const sendWishProvider = SendWishProvider._();

final class SendWishProvider extends $AsyncNotifierProvider<SendWish, void> {
  const SendWishProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendWishProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendWishHash();

  @$internal
  @override
  SendWish create() => SendWish();
}

String _$sendWishHash() => r'f948470728fef8b47c09ce39259410c9a51df8d6';

abstract class _$SendWish extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
