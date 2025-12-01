import 'package:frontend/feature/wish/data/service/wish_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class WishLocalService extends WishService {
  WishLocalService({required super.client});

  @override
  Future<Map<String, dynamic>?> getWishesRaw() async {
    const String getWishesQuery = """
      query GetWishes {
        getWishes {
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
      mutation SendWish(\$writer: String!, \$content: String!, \$dear: String) {
        sendWish (writer: \$writer, content: \$content, dear: \$dear) {
          writer
          dear
          content
          createdAt
        }
      }
    """;

    final result = await client.mutate(
      MutationOptions(
        document: gql(createWishMutation),
        variables: {"writer": writer, "content": content, "dear": dear},
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
        getCountWishes
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
