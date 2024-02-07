import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:loginpage/helper/apiHelper.dart';
import 'package:loginpage/helper/loginhelper.dart';
import 'package:loginpage/model/usermodel.dart';
import 'package:loginpage/utils/constant/apiconstants.dart';

class ApiServices {
  final _apihelper = Apihelper();
  Future<void> register({
    required String name,
    required String username,
    required String password,
    required String phone,
  }) async {
    try {
      print('register');
      var response = await _apihelper.postData(
          url: ApiConstants.baseUrl + ApiConstants.registrationUrl,
          body: {
            "name": name,
            "username": username,
            "password": password,
            "phone": phone
          });
      if (response!.statusCode != 200) {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await _apihelper
          .postData(url: ApiConstants.baseUrl + ApiConstants.loginUrl, body: {
        "username": username,
        "password": password,
      });

      if (response!.statusCode == 200) {
        print(response.body);
        var data = jsonDecode(response.body);
        loginid = data['id'];
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Userdetails> getUser({required String id}) async {
    try {
      var response = await _apihelper.getData(
          url: ApiConstants.baseUrl + ApiConstants.singleuserUrl + id);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var user = data['userdetails'];
        var usermodel = Userdetails.fromJson(user);

        return usermodel;
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Userdetails> updateUser(
      {required String name,
      required String mobile,
      required String username,
      required String id}) async {
    try {
      var response = await _apihelper.updateUser(
          url: ApiConstants.baseUrl + ApiConstants.updateurl + id,
          data: {'name': name, 'username': username, 'mobile': mobile});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var _user = data['userdetails'];
        var _usermodel = Userdetails.fromJson(_user);
        return _usermodel;
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser({required String id}) async {
    try {
      var response = await _apihelper.deleteUser(
          url: ApiConstants.baseUrl + ApiConstants.deleteurl + id);

      if (response.statusCode != 200) {
        print(response.statusCode);
        throw Exception('something went wrong');
      }
    } catch (e) {
      rethrow;
    }
  }
}
