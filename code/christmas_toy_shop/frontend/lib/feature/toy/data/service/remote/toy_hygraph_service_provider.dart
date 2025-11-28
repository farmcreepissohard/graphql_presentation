import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/graphql_provider.dart';
import 'package:frontend/feature/toy/data/service/remote/toy_hygraph_service.dart';

final toyHygraphServiceProvider = Provider<ToyHygraphService>(
  (ref) => ToyHygraphService(client: ref.watch(graphqlClientProvider)),
);
