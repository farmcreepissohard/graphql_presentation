// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_schema.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

GraphQLObjectField<List<WishSchema>?, Object?, Object?>
    get getWishesGraphQLField => _getWishesGraphQLField.value;
final _getWishesGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<List<WishSchema>?, Object?, Object?>>(
    (setValue) =>
        setValue(wishSchemaGraphQLType.nonNull().list().field<Object?>(
          'getWishes',
          resolve: (obj, ctx) {
            final args = ctx.args;

            return getWishes();
          },
        )));

GraphQLObjectField<int?, Object?, Object?> get getCountWishesGraphQLField =>
    _getCountWishesGraphQLField.value;
final _getCountWishesGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<int?, Object?, Object?>>(
        (setValue) => setValue(graphQLInt.field<Object?>(
              'getCountWishes',
              resolve: (obj, ctx) {
                final args = ctx.args;

                return getCountWishes();
              },
            )));

GraphQLObjectField<WishSchema?, Object?, Object?> get sendWishGraphQLField =>
    _sendWishGraphQLField.value;
final _sendWishGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<WishSchema?, Object?, Object?>>(
        (setValue) => setValue(wishSchemaGraphQLType.field<Object?>(
              'sendWish',
              resolve: (obj, ctx) {
                final args = ctx.args;

                return sendWish(
                    writer: (args["writer"] as String),
                    content: (args["content"] as String),
                    dear: (args["dear"] as String?));
              },
            ))
              ..inputs.addAll([
                graphQLString.nonNull().inputField('writer'),
                graphQLString.nonNull().inputField('content'),
                graphQLString.inputField('dear')
              ]));

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final _wishSchemaGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<WishSchema>>((setValue) {
  final __name = 'WishSchema';

  final __wishSchemaGraphQLType = objectType<WishSchema>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__wishSchemaGraphQLType);
  __wishSchemaGraphQLType.fields.addAll(
    [
      graphQLString.nonNull().field(
            'writer',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.writer,
          ),
      graphQLString.field(
        'dear',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.dear,
      ),
      graphQLString.nonNull().field(
            'content',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.content,
          ),
      graphQLString.nonNull().field(
            'createdAt',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.createdAt,
          ),
    ],
  );

  return __wishSchemaGraphQLType;
});

/// Auto-generated from [WishSchema].
GraphQLObjectType<WishSchema> get wishSchemaGraphQLType =>
    _wishSchemaGraphQLType.value;
