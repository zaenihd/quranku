import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = "";
var errorMessageFromApi;

class RestClient extends GetxService {
  Dio _dio = Dio();

  //this is for header
  static header() => {
        'Content-Type': 'application/json',
        //  "authorization": "Bearer ${Get.put(LoginController()).token}"
      };

  Future<RestClient> init() async {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('REQUEST[${options.method}] => PATH: ${options.path} '
          '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('ERROR[${err.response?.statusCode}]');
      return handler.next(err);
    }));
  }

  Future<dynamic> request(
      String url, Method method, Map<String, dynamic>? params) async {
    Response response;
    print("Cek : $url");
    print("Cek : $params");
    try {
      if (method == Method.POST) {
        print("masuk sini");
        response = await _dio.post(
          url,
          data: params,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "authorization": "Bearer {Get.put(LoginController()).token.value}"
            },
          ),
        );
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(url,
            queryParameters: params,
            options: Options(
              headers: {
                "authorization":
                    "Bearer {Get.put(LoginController()).token.value}"
              },
            ));
      }
      print("Cek sini yaaa error: $response");
      errorMessageFromApi = json.decode(response.toString());
      print("ZEZE$errorMessageFromApi");

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      print("hahaha $e");
      throw Exception("Something Went Wrong");
    }
  }
}
