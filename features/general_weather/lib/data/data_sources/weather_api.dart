import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_design_components/keys/keys.dart';
import 'package:shared_design_components/constants/constants.dart';

@lazySingleton
class WeatherApi {
  final baseUrl = basicBaseUrl;
  final headers = {
    'Content-Type': 'application/json; charset=utf-8',
    'Server': 'openresty',
    'Content-Length': '491',
    'Connection': 'keep-alive',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Methods': 'GET, POST'
  };

  final appId = weatherApiKey;

  Future<http.Response> fetchWeather(
      {required double latitude, required double longitude}) async {
    final url = Uri.parse(
        '$baseUrl?lat=$latitude&lon=$longitude&unit=metric&APPID=$appId');
    final getResponse = await http.get(url);

    return getResponse;
  }
}
