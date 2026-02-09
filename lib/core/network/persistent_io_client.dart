import 'dart:io';

import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:http/io_client.dart';
import 'package:http/src/base_request.dart';

class PersistentIoClient extends IOClient {
  PersistentIoClient(HttpClient inner) : super(inner);

  String? _accessToken;
  set accessToken(token) {
    this._accessToken = token;
  }

  @override
  Future<IOStreamedResponse> send(BaseRequest request) async {
    request.persistentConnection = false;
    if (_accessToken != null) {
      // Add the Authorization header to every single request sent by this client
      request.headers['Authorization'] = 'Bearer $_accessToken';
    }
    // logPrint(
    //   'PersistentIoClient: send: headers--->' + request.headers.toString(),
    // );
    return await super.send(request);
  }
}
