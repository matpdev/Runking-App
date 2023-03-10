import 'package:runking_app/config/ENV/DEV.dart';
import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: API,
);

Dio dio = Dio(options);
