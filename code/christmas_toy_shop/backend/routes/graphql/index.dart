import 'package:backend/core/utils/playground.dart';
import 'package:backend/feature/toy/schema/toy_schema.dart';
import 'package:backend/feature/wish/schema/wish_schema.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:leto/leto.dart';
import 'package:leto_schema/leto_schema.dart';
import 'package:leto_shelf/leto_shelf.dart' hide Request, Response;
import 'package:shelf/shelf.dart' as shelf;

final schema = GraphQLSchema(
  queryType: objectType(
    'Query',
    fields: [
      getToysGraphQLField,
      getToyDetailGraphQLField,
      getWishesGraphQLField,
      getCountWishesGraphQLField,
    ],
  ),
  mutationType: objectType(
    'Mutation',
    fields: [
      sendWishGraphQLField,
    ],
  ),
);

final _shelfHandler = graphQLHttp(GraphQL(schema));

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  if (request.method == HttpMethod.get && request.uri.queryParameters.isEmpty) {
    return Response(
      body: playgroundHtml(endpoint: '/graphql'),
      headers: {'content-type': 'text/html'},
    );
  }

  try {
    final shelfRequest = await _toShelfRequest(request);
    final shelfResponse = await _shelfHandler(shelfRequest);
    return _fromShelfResponse(shelfResponse);
  } catch (e) {
    return Response(statusCode: 500, body: e.toString());
  }
}

Future<shelf.Request> _toShelfRequest(Request request) async {
  String? body;
  if (request.method != HttpMethod.get) {
    body = await request.body();
  }

  return shelf.Request(
    request.method.value,
    request.uri,
    headers: request.headers,
    body: body,
    context: {'shelf_graphql.request': request},
  );
}

Future<Response> _fromShelfResponse(shelf.Response response) async {
  return Response(
    statusCode: response.statusCode,
    headers: response.headers,
    body: await response.readAsString(),
  );
}
