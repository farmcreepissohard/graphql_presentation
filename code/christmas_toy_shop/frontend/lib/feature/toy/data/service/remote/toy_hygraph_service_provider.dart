import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/provider/hygraph_graphql_provider.dart';
import 'package:frontend/feature/toy/data/service/remote/toy_hygraph_service.dart';
import 'package:frontend/feature/toy/data/service/toy_service.dart';

final toyHygraphServiceProvider = Provider<ToyService>(
  (ref) => ToyHygraphService(client: ref.watch(hygraphGraphqlClientProvider)),
);
