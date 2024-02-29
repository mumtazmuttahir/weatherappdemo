import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_design_components/keys/keys.dart';

@lazySingleton
class WeatherApi {
  final baseUrl = Uri.parse('http://api.openweathermap.org/data/2.5/forecast');
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

  // final response = await http.post(baseURL)
  Future<http.Response> fetchWeather(
      {required double latitude, required double longitude}) async {
    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&unit=metric&APPID=$appId');
    final getResponse = await http.get(url);
    print(getResponse.body);
    return getResponse;
  }
}
