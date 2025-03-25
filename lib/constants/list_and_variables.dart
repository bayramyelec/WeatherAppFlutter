import 'package:dio/dio.dart';

List<String> cities = [
  'Adana',
  'Ankara',
  'İstanbul',
  'İzmir',
  'Muğla',
  'Aydın',
];

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.openweathermap.org/data/2.5',
    queryParameters: {
      'lang': 'tr',
      'units': 'metric',
      'appid': '3f00989d1726fb527f50cf81b140eaa5',
    },
  ),
);
