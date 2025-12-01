import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();

  static String get hygraphEndpoint => dotenv.env["HYGRAPH_ENDPOINT"] ?? "";
  static String get hygraphToken => dotenv.env["HYGRAPH_TOKEN"] ?? "";
}
