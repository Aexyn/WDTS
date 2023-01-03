import 'package:dio/dio.dart';
import 'package:wdtc/network/models/login_request.dart';
import 'package:wdtc/network/models/login_respnose.dart';

class NetworkManager {
  NetworkManager._privateConstructor();

  static final NetworkManager instance = NetworkManager._privateConstructor();

  var dio = Dio(BaseOptions(baseUrl: "http://restapi.adequateshop.com"));

  late String token;

  void login({
    String email = "Developer5@gmail.com",
    String password = "123456",
  }) async {
    try {
      var response = await dio.post('/api/authaccount/login',
          data: LoginRequest(email: email, password: password).toJson());
      var loginResponse =
          LoginResponse.fromJson(response.data as Map<String, dynamic>);
      token = loginResponse.data!.token!;
      print(loginResponse.data!.token);
    } catch (e) {
      print(e);
    }
  }

// Have to check if token has expired or not
  void getUsers() async {
    try {
      var response = await Dio(
        BaseOptions(
          baseUrl: "http://restapi.adequateshop.com",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      ).get('/api/users?page=1');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
