import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/graphql_provider.dart';
import 'package:frontend/feature/wish/data/service/remote/wish_hygraph_service.dart';

final wishHygraphServiceProvider = Provider<WishHygraphService>(
  (ref) => WishHygraphService(client: ref.watch(graphqlClientProvider)),
);
