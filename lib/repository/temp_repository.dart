import 'dart:io';

import '../data/remote/network/api_end_points.dart';
import '../data/remote/network/network_api_service.dart';

abstract class _TempAbstract {
  Future<dynamic> tempApi(Map<String, dynamic> body);
}

class TempRepository extends _TempAbstract {
  final _apiService = NetworkApiService();
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @override
  Future<dynamic> tempApi(dynamic body) async {
    try {
      final resp =
          await _apiService.postResponse(ApiLinks.tempUrl, body, header);
      return resp;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
