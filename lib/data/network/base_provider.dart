import 'package:get/get.dart';

mixin BaseProvider implements GetConnect{
  Map<String, String>? getHeader(String token, {String contentType = 'application/json'}) {
    return {'authorization': ' Bearer $token', 'Content-Type': contentType};
  }
}