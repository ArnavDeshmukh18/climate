import 'dart:convert';
import 'package:climate/Models/model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future getData(String location) async {
    //https://api.weatherapi.com/v1/current.json?key=95593148103e4cbdbc860621222107&q=Mumbai&aqi=no
    final queryParameters = {
      'key': '95593148103e4cbdbc860621222107',
      'q': location,
      'aqi': 'no'
    };
    final url =
        Uri.https('api.weatherapi.com', '/v1/current.json', queryParameters);
    var responce = await http.get(url);
    if (responce.statusCode == 200) {
      var json = jsonDecode(responce.body);
      return Weather.fromJson(json);
    }
  }
}
