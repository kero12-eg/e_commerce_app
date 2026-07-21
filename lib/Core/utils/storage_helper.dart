import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
   final storage = FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ),
);
 Future<void> saveaccessToken(String accesstoken) async {
    await storage.write(key: "access_token", value:accesstoken );
  }
  Future<void> saverefreshToken(String refreshtoken) async {
    await storage.write(key: "refresh_token", value:refreshtoken );
  }
  Future<String?> getAccessToken() async {
    return await storage.read(key: "access_token") ?? "";
  }
  Future<String?> getRefreshToken() async {
    return await storage.read(key: "refresh_token") ?? "";
  }
  Future<void> deleteToken() async {
    await storage.delete(key: "access_token");
    await storage.delete(key: "refresh_token");
  }
}