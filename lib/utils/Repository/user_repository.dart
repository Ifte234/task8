import 'dart:math';

import 'package:dio/dio.dart';
import 'package:task8/utils/Repository/api_services.dart';

class UserRepository {
  Api api = Api();
  Future<void> fetchUsers() async {
    try {
      Response response = await api.sendRequest.get("/users");
      log(response.data);
    } catch (ex) {
      throw ex.toString();
    }
  }
}
