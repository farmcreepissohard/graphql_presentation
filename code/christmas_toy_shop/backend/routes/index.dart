import 'package:backend/core/database/mongo_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) async{
  try {
    final db = await MongoClient.connection;
    final state = db.state;
    final dbName = db.databaseName;

    return Response.json(
      body: {
        'message': 'Successfully connect to Mongodb',
        'mongo_state': state == State.OPEN ? 'Connected' : 'Disconnected',
        'database_name': dbName,
      },
    );

  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {
        'error': 'Disconnect to Mongodb',
        'details': e.toString(),
      },
    );
  }
}
