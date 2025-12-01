import 'package:frontend/feature/toy/data/service/toy_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ToyHygraphService extends ToyService {
  ToyHygraphService({required super.client});

  @override
  Future<Map<String, dynamic>?> getToysRaw() async {
    const String getToysQuery = """
      query GetToys {
        toys {
          toyId
          name
          price
          image {
            url
          }
          quantity
        }
      }
    """;

    final result = await client.query(
      QueryOptions(document: gql(getToysQuery)),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data;
  }

  @override
  Future<Map<String, dynamic>?> getToyDetailRaw(String toyId) async {
    const String getToyByIdQuery = """ 
      query GetToy(\$id: String!) {
        toy (where: {toyId: \$id}) {
          toyId
          name
          price
          description {
            text
          }
          image {
            url
          }
          quantity
        }
      }
    """;

    final result = await client.query(
      QueryOptions(document: gql(getToyByIdQuery), variables: {"id": toyId}),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data;
  }
}
