import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: 'https://themealdb.com/api/json/v1/1',
  headers: {
    'content-type': 'application/json',
  },
);
final dioMeal = Dio(options);
