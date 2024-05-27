import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../Services/model/my_data_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/api/users')
  Future<MyPage> getUsers();
  // If we got array from model then just pass list
  // Future<List>MyPage>> getUsers();
  @GET('/api/users/2')
  Future<dynamic> getPosts();
}
