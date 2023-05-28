import 'package:dio/dio.dart';
import 'package:weather_app/data/datasource/dio/dio_client.dart';
import 'package:weather_app/data/datasource/exception/api_error_handler.dart';
import 'package:weather_app/data/model/response/base/api_response.dart';
import 'package:weather_app/util/app_conostant.dart';

double progressPercent = 0;
class  WeatherRepo{
  final DioClient dioClient;
  WeatherRepo({required this.dioClient});

  //TODO: get searchResult
  Future<ApiResponse>getSearchResult( String location) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("${AppConstant.baseUrl}${AppConstant.search}${AppConstant.apiKey}&q=$location");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse>getAdressName(double lat,double lon) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("${AppConstant.baseUrl}${AppConstant.search}${AppConstant.apiKey}&q=$lat,$lon");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}