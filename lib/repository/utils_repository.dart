import 'package:dio/dio.dart';

Future<Map> getAddress(String cep) async {
  try {
    final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    return response.data as Map;
  } on DioError catch (e) {
    print(e);
    return e.response?.data as Map;
  }
}
