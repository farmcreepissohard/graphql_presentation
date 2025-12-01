// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toy_schema.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

GraphQLObjectField<List<ToySchema>?, Object?, Object?>
    get getToysGraphQLField => _getToysGraphQLField.value;
final _getToysGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<List<ToySchema>?, Object?, Object?>>(
    (setValue) => setValue(toySchemaGraphQLType.nonNull().list().field<Object?>(
          'getToys',
          resolve: (obj, ctx) {
            final args = ctx.args;

            return getToys();
          },
        )));

GraphQLObjectField<ToySchema?, Object?, Object?> get getToyDetailGraphQLField =>
    _getToyDetailGraphQLField.value;
final _getToyDetailGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<ToySchema?, Object?, Object?>>(
        (setValue) => setValue(toySchemaGraphQLType.field<Object?>(
              'getToyDetail',
              resolve: (obj, ctx) {
                final args = ctx.args;

                return getToyDetail((args["toyId"] as String));
              },
            ))
              ..inputs.addAll([graphQLString.nonNull().inputField('toyId')]));

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final _toyImageSchemaGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<ToyImageSchema>>((setValue) {
  final __name = 'ToyImageSchema';

  final __toyImageSchemaGraphQLType = objectType<ToyImageSchema>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__toyImageSchemaGraphQLType);
  __toyImageSchemaGraphQLType.fields.addAll(
    [
      graphQLString.nonNull().field(
            'url',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.url,
          )
    ],
  );

  return __toyImageSchemaGraphQLType;
});

/// Auto-generated from [ToyImageSchema].
GraphQLObjectType<ToyImageSchema> get toyImageSchemaGraphQLType =>
    _toyImageSchemaGraphQLType.value;

final _toyDescriptionSchemaGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<ToyDescriptionSchema>>(
        (setValue) {
  final __name = 'ToyDescriptionSchema';

  final __toyDescriptionSchemaGraphQLType = objectType<ToyDescriptionSchema>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__toyDescriptionSchemaGraphQLType);
  __toyDescriptionSchemaGraphQLType.fields.addAll(
    [
      graphQLString.nonNull().field(
            'text',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.text,
          )
    ],
  );

  return __toyDescriptionSchemaGraphQLType;
});

/// Auto-generated from [ToyDescriptionSchema].
GraphQLObjectType<ToyDescriptionSchema> get toyDescriptionSchemaGraphQLType =>
    _toyDescriptionSchemaGraphQLType.value;

final _toySchemaGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<ToySchema>>((setValue) {
  final __name = 'ToySchema';

  final __toySchemaGraphQLType = objectType<ToySchema>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__toySchemaGraphQLType);
  __toySchemaGraphQLType.fields.addAll(
    [
      graphQLString.nonNull().field(
            'toyId',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.toyId,
          ),
      graphQLString.nonNull().field(
            'name',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.name,
          ),
      graphQLFloat.nonNull().field(
            'price',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.price,
          ),
      toyDescriptionSchemaGraphQLType.nonNull().field(
            'description',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.description,
          ),
      toyImageSchemaGraphQLType.nonNull().field(
            'image',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.image,
          ),
      graphQLInt.nonNull().field(
            'quantity',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.quantity,
          ),
    ],
  );

  return __toySchemaGraphQLType;
});

/// Auto-generated from [ToySchema].
GraphQLObjectType<ToySchema> get toySchemaGraphQLType =>
    _toySchemaGraphQLType.value;
