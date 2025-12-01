import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final localGraphqlClientProvider = Provider<GraphQLClient>((ref) {
  const String url = 'http://192.168.68.114:8080/graphql';

  final HttpLink httpLink = HttpLink(url);

  return GraphQLClient(link: httpLink, cache: GraphQLCache());
});

/// port
/// android: 10.0.2.2:8080
/// IOS: localhost:8080
/// real: 192.168.1.X:8080