import 'package:device_info/device_info.dart';

import 'package:dio/dio.dart';

/// 可支持 restful 请求和普通API请求
///
/// GET、POST、DELETE、PATCH <br>
/// 主要作用为统一处理相关事务：<br>
///  - 统一处理请求前缀；<br>
///  - 统一打印请求信息；<br>
///  - 统一打印响应信息；<br>
///  - 统一打印报错信息；
class HttpUtil {
  static final debug = true;

  //域名
  static String _onlineBaseUrl = "https://m.8591.com.hk/api/v1/";
  static String _debugBaseUrl = "https://m.debug.8591.com.hk/api/v1/";

  /// global dio object
  static Dio dio;

  /// default options
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// 创建 dio 实例对象
  static Future<Dio> createInstance() async {
    if (dio == null) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(
          baseUrl: debug ? _debugBaseUrl : _onlineBaseUrl,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers: {
            "User-Agent": "version/${androidInfo.version}" +
                " version_code/1" +
                " clients/android" +
                " imei/${androidInfo.androidId}" +
                " model/${androidInfo.model}"
          });

      print(options.headers);
      dio = new Dio(options);
      addInterceptors(dio);
    }

    return dio;
  }

  /// 添加拦截器
  static addInterceptors(Dio dio) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options; //continue
    }, onResponse: (Response response) {
      return response; // continue
    }, onError: (DioError e) {
      return e; //continue
    }));
  }

  /// request method
  static Future<Map> request(String url, {data, method, cancelToken}) async {
    data = data ?? {};
    method = method ?? 'POST';

    /// restful 请求处理
    /// /api/search/user/:user_id   user_id=27
    /// 最终生成url为: /api/search/user/27
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印请求相关信息：请求地址、请求方式、请求参数
    if (debug) {
      print("=========================================");
      print('请求地址：【' + method + '  ' + url + '】');
      print('请求参数：' + data.toString());
    }

    /// 创建单例对象
    Dio dio = await createInstance();

    Response response;
    try {
      if (method != null) dio.options.method = method;
      response = await dio.request(url, data: data, cancelToken: cancelToken);

      /// 打印响应相关信息
      if (debug) print('响应数据：' + response.toString());
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) print('请求取消： ' + e.message);

      /// 打印请求失败相关信息
      if (debug) print('请求出错：' + handleError(e));
    }

    return response.data;
  }

  /// 错误处理
  static handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${error.response.statusCode}";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
