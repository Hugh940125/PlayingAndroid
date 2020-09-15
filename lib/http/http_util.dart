import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:playing/configs.dart';
import 'package:playing/http/sign_tool.dart';

typedef SuccessCallback<T> = void Function(T data);
typedef ErrorCallback = void Function(String msg);
typedef RefreshTokenCallback = void Function();

class HttpUtil<T> {
  Dio _dio;

  static HttpUtil _instance = HttpUtil._();

  static HttpUtil getInstance<T>(){
    return _instance;
  }

  factory HttpUtil() => getInstance<T>();

  HttpUtil._() {
    _dio = Dio();
    _dio.options.connectTimeout = 15 * 1000;
    _dio.options.receiveTimeout = 30 * 1000;
    _dio.options.baseUrl = Configs.baseUrl;
    _dio.options.contentType = "application/json;charset=UTF-8";
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      _dio.options.headers = {
        //获取存储的token
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'Bearer '+ token,
      };
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError error) {
      return error;
    }));
  }

  //get请求
  void get(String url,SuccessCallback onSuccess,RefreshTokenCallback onRefreshToken,ErrorCallback onError,{Map<String,dynamic> params}) async {
    _request(url, 'GET',onSuccess,onRefreshToken,onError);
  }

  //加入签名的Post请求
  void signPost(String url, SuccessCallback onSuccess, RefreshTokenCallback onRefreshToken, ErrorCallback onError, {Map<String,dynamic> params}){
    _request(url, 'POST',onSuccess, onRefreshToken, onError, params: params,sign: true);
  }

  //不用签名的Post请求
  void post(String url, SuccessCallback onSuccess, RefreshTokenCallback onRefreshToken, ErrorCallback onError, {Map<String,dynamic> params}){
    _request(url, 'POST',onSuccess, onRefreshToken, onError, params: params,sign: false);
  }

  void _request(String url, String method, SuccessCallback onSuccess, RefreshTokenCallback onRefreshToken, Function onError,
      {bool sign, Map<String, dynamic> params}) async {
    Response response;
    if (method == 'GET'){
      if(params != null && params.isNotEmpty){
        StringBuffer buffer = StringBuffer('?');
        params.forEach((key, value) {
          buffer.write("$key = $value");
        });
        String bufferString = buffer.toString();
        String paramStr = bufferString.substring(0,bufferString.length-1);
        url += paramStr;
      }
      response = await _dio.get(url);
    }else if(method == 'POST'){
      if(params != null && params.isNotEmpty){
        if(sign){
          params['appKey'] = Configs.appKey;
          params['timestamp'] = (DateTime.now().millisecondsSinceEpoch~/1000).toString();
          params['sign'] = SignTool.getSignedParam(params, Configs.appSecret);
        }
        response = await _dio.post(url,data: params);
      }
    }
    int statusCode = response.statusCode;
    String encodeResponse = json.encode(response.data);
    Map<String,dynamic> decodeMap = json.decode(encodeResponse);
    if(statusCode == 200){
      onSuccess(decodeMap);
    } else if(statusCode == 10006){
      _refreshToken(onRefreshToken);
    }else{
      onError(decodeMap['errMsg']);
    }
  }
}

void _refreshToken(RefreshTokenCallback onRefreshToken) async{
}
