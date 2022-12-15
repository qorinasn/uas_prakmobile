import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zicakes/models/models_cake.dart';

class CakeService {
  static Future<List<Data>> fetchData() async {
    Dio dio = Dio();

    var response = await dio.get('http://192.168.18.183:3000/cake');
    List<Data> cake =
        (response.data['data'] as List).map((v) => Data.fromJson(v)).toList();
    return cake;
  }
}
