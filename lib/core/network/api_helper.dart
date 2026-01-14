import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:family_wifi/core/network/api_constants.dart';
import 'package:family_wifi/core/network/api_exception.dart';
import 'package:family_wifi/core/network/persistent_io_client.dart';
import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  late final String _host, _portAuth, _portDefault, _suffix;
  Map<String, String> get _headers => {'Content-Type': 'application/json'};

  late final PersistentIoClient persistentIoClient;

  ApiHelper() {
    if (ApiConstants.developmentMode) {
      _host = ApiConstants.baseUrlDev;
      _suffix = ApiConstants.suffixDev;
      _portAuth = ApiConstants.authPortDev;
      _portDefault = ApiConstants.defaultPortDev;
    } else {
      _host = ApiConstants.baseUrl;
      _suffix = ApiConstants.suffix;
      _portAuth = ApiConstants.authPort;
      _portDefault = ApiConstants.defaultPort;
    }
    initClient();
  }

  void initClient() {
    final httpClient = HttpClient();
    httpClient.connectionTimeout = const Duration(
      seconds: ApiConstants.connectionTimeoutSec,
    );
    httpClient.idleTimeout = const Duration(
      seconds: ApiConstants.idleTimeoutSec,
    );
    persistentIoClient = PersistentIoClient(httpClient);
  }

  close() {
    persistentIoClient.close();
  }

  Future<Map<String, dynamic>> request(
    String path, {
    RequestType requestType = RequestType.GET,
    Map<String, dynamic>? parameters,
    Object? requestBody,
    bool checkStatus = true,
    bool utf8Decode = false,
  }) async {
    if (!await check()) {
      throw ApiException('out_of_coverage', isOutOfCoverage: true);
    }
    String hostName = _host;
    if (path == ApiConstants.login) {
      hostName += _portAuth;
    } else {
      hostName += _portDefault;
    }
    final Uri uri = Uri.https(hostName, '$_suffix$path', parameters);
    try {
      String? encodedBody;
      http.Response? response;
      logPrint('URL--->${uri.toString()}');
      switch (requestType) {
        case RequestType.GET:
          response = await http.get(uri, headers: _headers);
          break;
        case RequestType.POST:
          encodedBody = _prepareJSONEncoded(parameters, requestBody);
          printWrapped('Request Body--->$encodedBody');
          response = await http.post(uri, headers: _headers, body: encodedBody);
          break;
        case RequestType.PUT:
          encodedBody = _prepareJSONEncoded(parameters, requestBody);
          response = await http.put(uri, headers: _headers, body: encodedBody);
          break;
        case RequestType.DELETE:
          response = await http.delete(uri, headers: _headers);
          break;
      }
      int responseCode = response.statusCode;
      logPrint('Response Code--->$responseCode');
      dynamic json;
      if (utf8Decode) {
        json = jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        json = jsonDecode(response.body);
      }
      printWrapped('Response Body--->$json');
      if (responseCode >= 200 && responseCode < 300) {
        if (checkStatus) {
          if (json['ErrorDescription'] == null &&
              json['ErrorDetails'] == null) {
            return json;
          } else if (json['responseMessage'] != null) {
            throw ApiException(
              json['responseMessage'] ?? 'Failed',
              translate: false,
              data: json,
            );
          } else {
            throw ApiException(
              'something_went_wrong',
              reportToCrashlytics: true,
            );
          }
        } else {
          return json;
        }
      } else {
        throw ApiException(
          handleErrorResponseCode(responseCode),
          reportToCrashlytics: true,
        );
      }
    } on HttpException catch (e, stack) {
      bool available = await check(checkActiveInternet: true);
      logPrint('Internet Available--->$available');
      throw ApiException(
        available ? 'unable_to_reach_server' : 'out_of_coverage',
        isOutOfCoverage: !available,
      );
    } on SocketException catch (e, stack) {
      bool available = await check(checkActiveInternet: true);
      logPrint('Internet Available--->$available');
      throw ApiException(
        available ? 'unable_to_reach_server' : 'out_of_coverage',
        isOutOfCoverage: !available,
      );
    } on http.ClientException catch (e, stack) {
      bool available = await check(checkActiveInternet: true);
      logPrint('Internet Available--->$available');
      throw ApiException(
        available ? 'unable_to_reach_server' : 'out_of_coverage',
        isOutOfCoverage: !available,
      );
    } on FormatException catch (e, stack) {
      bool available = await check(checkActiveInternet: true);
      logPrint('Internet Available--->$available');
      throw ApiException('something_went_wrong');
    } catch (e, stack) {
      logPrint('request: Exception--->$e');
      if (e is ApiException) {
        rethrow;
      } else {
        bool available = await check(checkActiveInternet: true);
        logPrint('Internet Available--->$available');
        throw ApiException(
          available ? 'something_went_wrong' : 'out_of_coverage',
          isOutOfCoverage: !available,
        );
      }
    }
  }

  String? _prepareJSONEncoded(
    Map<String, dynamic>? parameters,
    Object? requestBody,
  ) {
    if (parameters != null) {
      return jsonEncode(parameters);
    } else if (requestBody != null) {
      return jsonEncode(requestBody);
    }
    return null;
  }

  static Future<bool> check({bool checkActiveInternet = false}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      if (checkActiveInternet) {
        try {
          final result = await InternetAddress.lookup(
            'google.com',
          ).timeout(const Duration(seconds: 5));
          logPrint('InternetAddress lookup result--->$result');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            return true;
          }
        } on SocketException catch (_) {
          logPrint('Socket Exception while InternetAddress lookup');
          return false;
        } catch (e) {
          logPrint('Exception while InternetAddress lookup: exception--->$e');
          return false;
        }
      }
      return true;
    }
    return false;
  }
}

String handleErrorResponseCode(int responseCode) {
  switch (responseCode) {
    case 401:
    case 403:
      return 'error_unauthorised';
    case 404:
      return 'error_not_found';
    case 504:
      return 'error_timeout';
    default:
      return 'something_went_wrong';
  }
}

enum RequestType { GET, POST, PUT, DELETE }
