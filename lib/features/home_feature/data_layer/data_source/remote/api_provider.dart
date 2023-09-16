import 'package:anywhere_variant_one/core/constants/consstants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> callSimpsonData() async {
    var response = await _dio.get(Constants.baseUrl, queryParameters: {
      'q': 'simpsons characters',
      'format': 'json',

    });
    print(response.data);
    return response;

  }

}
