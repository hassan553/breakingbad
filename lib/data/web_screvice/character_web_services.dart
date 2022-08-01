import 'package:breakingbad/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (onError) {
      // ignore: avoid_print
      print(onError.toString());
      return [];
    }
  }

  Future<List<dynamic>> getAllCharactersQuate(
      {required String charQuate}) async {
    try {
      Response response = await dio.get(
        'quate',
        queryParameters: {
          'author': charQuate,
        },
      );
      return response.data;
    } catch (onError) {
      // ignore: avoid_print
      print(onError.toString());
      return [];
    }
  }
}
