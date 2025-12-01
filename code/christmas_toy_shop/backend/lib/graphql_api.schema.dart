// ignore: depend_on_referenced_packages
import 'package:leto_schema/leto_schema.dart';
import 'package:backend/feature/toy/schema/toy_schema.dart';
import 'package:backend/feature/wish/schema/wish_schema.dart';

GraphQLSchema recreateGraphQLApiSchema() {
  HotReloadableDefinition.incrementCounter();
  _graphqlApiSchema = null;
  return graphqlApiSchema;
}

GraphQLSchema? _graphqlApiSchema;
GraphQLSchema get graphqlApiSchema => _graphqlApiSchema ??= GraphQLSchema(
      serdeCtx: SerdeCtx()
        ..addAll([])
        ..children.addAll([]),
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
