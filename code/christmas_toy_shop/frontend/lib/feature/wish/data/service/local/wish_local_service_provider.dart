import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/provider/local_graphql_provider.dart';
import 'package:frontend/feature/wish/data/service/local/wish_local_service.dart';
import 'package:frontend/feature/wish/data/service/wish_service.dart';

final wishLocalServiceProvider = Provider<WishService>(
  (ref) => WishLocalService(client: ref.watch(localGraphqlClientProvider)),
);
