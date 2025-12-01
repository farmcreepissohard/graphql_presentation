import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/provider/local_graphql_provider.dart';
import 'package:frontend/feature/toy/data/service/local/toy_local_service.dart';
import 'package:frontend/feature/toy/data/service/toy_service.dart';

final toyLocalServiceProvider = Provider<ToyService>(
  (ref) => ToyLocalService(client: ref.watch(localGraphqlClientProvider)),
);
