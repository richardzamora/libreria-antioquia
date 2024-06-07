import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoadEnvHelper {
  LoadEnvHelper._();
  static Future<Map<String, String>> loadEnvFile(String path) async {
    await dotenv.load(fileName: path);
    return dotenv.env;
  }

  static bool isDevelopment() {
    return dotenv.env['ENVIROMENT'] == 'dev';
  }

  static bool isMock() {
    return dotenv.env['ENVIROMENT'] == 'mock';
  }
}
