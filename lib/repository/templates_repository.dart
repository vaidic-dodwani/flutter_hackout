import 'dart:io';

import 'package:flutter_hackout/data/remote/network/api_end_points.dart';
import 'package:flutter_hackout/data/remote/network/network_api_service.dart';
import 'package:flutter_hackout/model/template_model.dart';

abstract class _TemplatesAbstarct {
  Future<List<Template>> getTemplates();
}

class TemplatesRepository implements _TemplatesAbstarct {
  final _apiService = NetworkApiService();
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @override
  Future<List<Template>> getTemplates() async {
    try {
      final resp = await _apiService.getResponse(ApiLinks.template, header);
      return List<Template>.from(resp.map((e) => Template.fromJson(e)));
    } on Exception catch (_) {
      rethrow;
    }
  }
}
