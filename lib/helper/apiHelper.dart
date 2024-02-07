import 'dart:io';

import 'package:http/http.dart' as http;

class Apihelper {
  final Client = http.Client();
  Future<http.Response?> postData(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      print(url);

      var response = await Client.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: body);
      print(response.statusCode);
      return response;
    } on FormatException {
      throw Exception('Formate exception');
    } on SocketException {
      throw Exception('No internet');
    }
  }

  //get data
  Future<http.Response> getData({required String url}) async {
    try {
      var response = await Client.get(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      });
      print(url);
      return response;
    } on FormatException {
      throw Exception('format exception');
    } on SocketException {
      throw Exception('no internet');
    }
  }

  //update user
  Future<http.Response> updateUser(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      var response = await Client.put(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: data);
      return response;
    } on FormatException {
      throw Exception('format exception');
    } on SocketException {
      throw Exception('no internet');
    }
  }

  //delete
  Future<http.Response> deleteUser({required String url}) async {
    try {
      var response = await Client.delete(Uri.parse(url));
      return response;
    } on FormatException {
      throw Exception('format exception');
    } on SocketException {
      throw Exception('no internet');
    }
  }
}
