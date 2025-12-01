import 'package:graphql_flutter/graphql_flutter.dart';

abstract class ToyService {
  final GraphQLClient client;
  ToyService({required this.client});

  Future<Map<String, dynamic>?> getToysRaw();
  Future<Map<String, dynamic>?> getToyDetailRaw(String toyId);
}
