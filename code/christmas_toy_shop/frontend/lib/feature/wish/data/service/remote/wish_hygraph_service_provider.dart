import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/provider/hygraph_graphql_provider.dart';
import 'package:frontend/feature/wish/data/service/remote/wish_hygraph_service.dart';
import 'package:frontend/feature/wish/data/service/wish_service.dart';

final wishHygraphServiceProvider = Provider<WishService>(
  (ref) => WishHygraphService(client: ref.watch(hygraphGraphqlClientProvider)),
);
