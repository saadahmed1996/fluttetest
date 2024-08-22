// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/services/app_logger.dart';
import 'package:flutter_test_project/services/connectivity_manager.dart';
import 'package:flutter_test_project/services/local_storage.dart';
import 'package:flutter_test_project/services/logger_interceptors.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_network_strings.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';

class Network {
  static Dio? _dio;
  static CancelToken? _cancelRequestToken;

  static Network? _network;

  static ConnectivityManager? _connectivityManager;

  Network._createInstance();

  factory Network() {
    //! ============> factory with constructor, return some value
    if (_network == null) {
      _network = Network
          ._createInstance(); //! ============> This is executed only once, singleton object

      _dio = _getDio();
      _dio?.interceptors.add(LoggingInterceptor());
      _cancelRequestToken = _getCancelToken();
      _connectivityManager = ConnectivityManager();
    }
    return _network!;
  }

  static Dio _getDio() {
    // BaseOptions options = new BaseOptions(
    //   connectTimeout: 20000,
    // );
    return _dio ??= Dio();
  }

  static CancelToken _getCancelToken() {
    return _cancelRequestToken ??= CancelToken();
  }

  ////////////////// Get Request /////////////////////////
  Future<Response?> getRequest(
      {required BuildContext context,
      required String endPoint,
      Map<String, dynamic>? queryParameters,
      VoidCallback? onFailure,
      bool isToast = true,
      bool isErrorToast = true,
      int connectTimeOut = 20000,
      required bool isHeaderRequire}) async {
    Response? response;

    if (await _connectivityManager!.isInternetConnected()) {
      try {
        _dio?.options.connectTimeout = connectTimeOut;
        response = await _dio!.get(NetworkStrings.API_BASE_URL + endPoint,
            queryParameters: queryParameters,
            cancelToken: _cancelRequestToken,
            options: Options(
              headers: _setHeader(isHeaderRequire: isHeaderRequire),
              sendTimeout: connectTimeOut,
              receiveTimeout: connectTimeOut,
            ));
      } on DioError catch (e) {
        log("Error:${e.response.toString()}");
        _validateException(
            response: e.response,
            context: context,
            message: e.message,
            onFailure: onFailure,
            isToast: isToast,
            isErrorToast: isErrorToast);
        print("$endPoint Dio: ${e.message}");
      }
    } else {
      _noInternetConnection(onFailure: onFailure);
    }

    return response;
  }

  ////////////////// Post Request /////////////////////////
  Future<Response?> postRequest({
    required BuildContext context,
    required String endPoint,
    FormData? formData,
    VoidCallback? onFailure,
    bool isToast = true,
    int connectTimeOut = 20000,
    bool isErrorToast = true,
    required bool isHeaderRequire,
  }) async {
    Response? response;
    if (await _connectivityManager!.isInternetConnected()) {
      try {
        _dio?.options.connectTimeout = connectTimeOut;
        response = await _dio!.post(
          NetworkStrings.API_BASE_URL + endPoint,
          data: formData,
          cancelToken: _cancelRequestToken,
          options: Options(
            headers: _setHeader(isHeaderRequire: isHeaderRequire),
            sendTimeout: connectTimeOut,
            receiveTimeout: connectTimeOut,
          ),
        );
      } on DioError catch (e) {
        _validateException(
            response: e.response,
            context: context,
            message: e.message,
            onFailure: onFailure,
            isToast: isToast,
            isErrorToast: isErrorToast);
        print("$endPoint Dio: ${e.message}");
      }
    } else {
      _noInternetConnection(onFailure: onFailure);
    }
    return response;
  }

  ////////////////// Put Request /////////////////////////
  Future<Response?> putRequest(
      {required BuildContext context,
      required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      VoidCallback? onFailure,
      bool isToast = true,
      int connectTimeOut = 20000,
      bool isErrorToast = true,
      required bool isHeaderRequire}) async {
    Response? response;

    if (await _connectivityManager!.isInternetConnected()) {
      try {
        _dio?.options.connectTimeout = connectTimeOut;
        response = await _dio!.put(NetworkStrings.API_BASE_URL + endPoint,
            queryParameters: queryParameters,
            data: body,
            cancelToken: _cancelRequestToken,
            options: Options(
                headers: _setHeader(isHeaderRequire: isHeaderRequire),
                sendTimeout: connectTimeOut,
                receiveTimeout: connectTimeOut));
      } on DioError catch (e) {
        _validateException(
            response: e.response,
            context: context,
            message: e.message,
            onFailure: onFailure,
            isToast: isToast,
            isErrorToast: isErrorToast);
        print("$endPoint Dio: " + e.message);
      }
    } else {
      _noInternetConnection(onFailure: onFailure);
    }

    return response;
  }

  ////////////////// Delete Request /////////////////////////
  Future<Response?> deleteRequest({
    required BuildContext context,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    VoidCallback? onFailure,
    bool isToast = true,
    int connectTimeOut = 20000,
    bool isErrorToast = true,
    required bool isHeaderRequire,
  }) async {
    Response? response;
    if (await _connectivityManager!.isInternetConnected()) {
      try {
        _dio?.options.connectTimeout = connectTimeOut;
        response = await _dio!.delete(NetworkStrings.API_BASE_URL + endPoint,
            queryParameters: queryParameters,
            cancelToken: _cancelRequestToken,
            options: Options(
                headers: _setHeader(isHeaderRequire: isHeaderRequire),
                sendTimeout: connectTimeOut,
                receiveTimeout: connectTimeOut));
        print(response.toString());
      } on DioError catch (e) {
        _validateException(
            response: e.response,
            context: context,
            message: e.message,
            onFailure: onFailure,
            isToast: isToast,
            isErrorToast: isErrorToast);
        print("$endPoint Dio: ${e.message}");
      }
    } else {
      _noInternetConnection(onFailure: onFailure);
    }
    return response;
  }

  ////////////////// Post Request Raw Data /////////////////////////
  Future<Response?> postRequestRawData({
    required String endPoint,
    Map<String, dynamic>? body,
    VoidCallback? onFailure,
    bool isToast = true,
    int connectTimeOut = 20000,
    bool isErrorToast = true,
    required bool isHeaderRequire,
    required BuildContext context,
  }) async {
    Response? response;

    if (await _connectivityManager!.isInternetConnected()) {
      try {
        _dio?.options.connectTimeout = connectTimeOut;
        response = await _dio!.post(
          NetworkStrings.API_BASE_URL + endPoint,
          data: body,
          cancelToken: _cancelRequestToken,
          options: Options(
            headers: _setHeader(isHeaderRequire: isHeaderRequire),
            sendTimeout: connectTimeOut,
            receiveTimeout: connectTimeOut,
          ),
        );
      } on DioError catch (e) {
        //   response=e.response;
        _validateException(
          response: e.response,
          message: e.message,
          onFailure: onFailure,
          isToast: isToast,
          isErrorToast: isErrorToast,
          context: context,
        );
        print("$endPoint Dio: ${e.message}");
      }
    } else {
      _noInternetConnection(
        onFailure: onFailure,
        // isErrorToast: isErrorToast,
      );
    }
    return response;
  }

  ////////////////// Set Header /////////////////////
  _setHeader({required bool isHeaderRequire}) {
    if (isHeaderRequire == true) {
      String token = SharedPreference().getBearerToken() ?? "";
      // String currentUser = SharedPreference().getUser() ?? "";
      // final jsonResponse = jsonDecode(currentUser);
      // final UserOfApp _currentUser = UserOfApp.fromJson(jsonResponse);
      logData(message: "Network Token: $token");
      return {
        'Accept': NetworkStrings.ACCEPT,
        'Authorization': "Bearer $token",
        // "Content-Type": "application/x-www-form-urlencoded"
      };
    } else {
      return {
        'Accept': NetworkStrings.ACCEPT,
        // "Content-Type": "application/x-www-form-urlencoded"
      };
    }
  }

  ////////////////// Validate Response /////////////////////
  void validateResponse(
      {Response? response,
      VoidCallback? onSuccess,
      VoidCallback? onFailure,
      bool isToast = true}) {
    var validateResponseData = response?.data;

    if (validateResponseData != null) {
      isToast
          ? AppDialogs.showToast(message: validateResponseData['message'] ?? "")
          : null;
      if (response!.statusCode == NetworkStrings.SUCCESS_CODE ||
          response.statusCode == 201) {
        // if (validateResponseData['status'] ==
        //     NetworkStrings.API_SUCCESS_STATUS) {
        //   if (onSuccess != null) {
        //     onSuccess();
        //   }
        // } else {
        //   if (onFailure != null) {
        //     onFailure();
        //   }
        // }
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        if (onFailure != null) {
          onFailure();
        }
        log(response.statusCode.toString());
      }
      // logData(message: "message: ${validateResponseData}");
      // logData(message: "message: ${response?.statusCode}");
      // if (onSuccess != null) {
      //   onSuccess();
      // }
    }
  }

  ////////////////// Stripe Validate Response /////////////////////
  void stripeValidateResponse(
      {Response? response, VoidCallback? onSuccess, VoidCallback? onFailure}) {
    var validateResponseData = response?.data;

    if (validateResponseData != null) {
      if (response!.statusCode == NetworkStrings.SUCCESS_CODE) {
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        if (onFailure != null) {
          onFailure();
        }
      }
    }
  }

  ////////////////// Validate Response /////////////////////
  void validateGifResponse(
      {Response? response, VoidCallback? onSuccess, VoidCallback? onFailure}) {
    var validateResponseData = response?.data;

    if (validateResponseData != null) {
      if (response!.statusCode == NetworkStrings.SUCCESS_CODE) {
        if (onSuccess != null) {
          onSuccess();
        }
      }
    } else {
      if (onFailure != null) {
        onFailure();
      }
    }
  }

  ////////////////// Validate Exception /////////////////////
  void _validateException(
      {required BuildContext context,
      Response? response,
      String? message,
      bool normalRequest = true,
      bool isToast = true,
      bool isErrorToast = true,
      VoidCallback? onFailure}) {
    log("Response:${response.toString()}");
    if (onFailure != null) {
      onFailure();
    }
    if (response?.statusCode == NetworkStrings.CARD_ERROR_CODE) {
      AppDialogs.showToast(
          message: response?.data["error"]["message"] ??
              NetworkStrings.INVALID_CARD_ERROR);
    } else if (response?.statusCode == NetworkStrings.BAD_REQUEST_CODE) {
      //to check normal api or stripe bad request error
      if (normalRequest == true) {
        //for normal api request error
        isToast
            ? AppDialogs.showToast(message: response?.data["message"] ?? "")
            : null;
      } else {
        //for stripe bad request error
        AppDialogs.showToast(
            message: response?.data["error"]["message"] ??
                NetworkStrings.INVALID_BANK_ACCOUNT_DETAILS_ERROR);
      }
    } else if (response?.statusCode == NetworkStrings.FORBIDDEN_CODE) {
      //to check normal api or stripe bad request error
      AppDialogs.showToast(message: response?.data["message"] ?? "");
    } else {
      isErrorToast
          ? AppDialogs.showToast(
              message: response?.statusMessage ?? message.toString())
          : null;
    }
    if (response?.statusCode == NetworkStrings.UNAUTHORIZED_CODE) {
      SharedPreference().clear();
      AppNavigation.navigateToRemovingAll(
        context,
        AppRouteName.LOGIN_SCREEN_ROUTE,
      );
    }
  }

  ////////////////// No Internet Connection /////////////////////
  void _noInternetConnection({VoidCallback? onFailure}) {
    if (onFailure != null) {
      onFailure();
    }
    AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
  }

// ////////////////// On TimeOut /////////////////////
  // void _onTimeOut({String? message, onFailure}) {
  //   if (onFailure != null) {
  //     onFailure();
  //   }
  //   AppDialogs.showToast(message: message);
  // }
}
