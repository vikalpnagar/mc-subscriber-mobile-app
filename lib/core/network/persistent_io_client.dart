import 'dart:io';

import 'package:http/io_client.dart';
import 'package:http/src/base_request.dart';

class PersistentIoClient extends IOClient {
  PersistentIoClient(HttpClient inner) : super(inner);

  @override
  Future<IOStreamedResponse> send(BaseRequest request) async {
    request.persistentConnection = false;
    return await super.send(request);
  }
}
