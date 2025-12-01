import 'package:frontend/feature/wish/data/service/wish_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class WishHygraphService extends WishService {
  WishHygraphService({required super.client});

  @override
  Future<Map<String, dynamic>?> getWishesRaw() async {
    const String getWishesQuery = """
      query GetWishes {
        wishes {
          writer
          dear
          content
          createdAt
        }
      }
    """;

    final result = await client.query(
      QueryOptions(
        document: gql(getWishesQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data;
  }

  @override
  Future<Map<String, dynamic>?> sendWishRaw({
    required String writer,
    required String content,
    String? dear,
  }) async {
    const String createWishMutation = """
      mutation SendWish(\$input: WishCreateInput!) {
        createWish (data: \$input) {
          id
        }
      }
    """;

    final tempResult = await client.mutate(
      MutationOptions(
        document: gql(createWishMutation),
        variables: {
          "input": {"writer": writer, "content": content, "dear": dear},
        },
      ),
    );

    if (tempResult.hasException) {
      throw tempResult.exception!;
    }

    final id = tempResult.data?["createWish"]?["id"];

    const String publishWishMutation = """
      mutation publishWish(\$ID: ID!) {
        publishWish (where: {id: \$ID}, to: PUBLISHED) {
          writer
    	    dear
    	    content
          createdAt
        }
      }
    """;

    final result = await client.mutate(
      MutationOptions(
        document: gql(publishWishMutation),
        variables: {"ID": id},
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data;
  }

  @override
  Future<Map<String, dynamic>?> getCountWishesRaw() async {
    const String getCountWishesQuery = """
      query GetCountWishes {
        wishesConnection {
          aggregate {
            count
          }
        }
      }
    """;

    final result = await client.query(
      QueryOptions(
        document: gql(getCountWishesQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data;
  }
}
