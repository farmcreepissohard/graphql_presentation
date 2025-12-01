import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/app_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final hygraphGraphqlClientProvider = Provider<GraphQLClient>((ref) {
  final HttpLink httpLink = HttpLink(AppConfig.hygraphEndpoint);

  final String token = AppConfig.hygraphToken;
  final AuthLink authLink = AuthLink(getToken: () => 'Bearer $token');

  final Link link = authLink.concat(httpLink);

  return GraphQLClient(link: link, cache: GraphQLCache());
});
